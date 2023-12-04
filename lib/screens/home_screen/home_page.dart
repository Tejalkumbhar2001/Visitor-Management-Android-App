import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/widgets/full_screen_loader.dart';
import 'package:stacked/stacked.dart';

import '../../router.router.dart';
import '../../widgets/drawer.dart';
import 'home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Homeviewmodel>.reactive(
        viewModelBuilder: () => Homeviewmodel(),
        onViewModelReady: (model) => model.initialise(context),
        builder: (context, model, child) => Scaffold(

              appBar: AppBar(

                title: const AutoSizeText('Home'),
                
              ),
              drawer: myDrawer(context, (model.userdata.fullName ?? ""),
                  (model.userdata.email ?? ""), (model.userdata.companyName ?? "")),
              body: WillPopScope(
                 onWillPop: ()  async{
                //   Navigator.popAndPushNamed(context,Routes.homePage);
                final value = await showDialog<bool>(
                       context: context,
                       builder: (context){
                     return AlertDialog(
                       title: const Text('Alert'),
                       content: const Text('Do You want to Exit'),
                       actions: [
                         ElevatedButton(onPressed: ()=>Navigator.of(context).pop(false),
                             child: const Text('No'),),
                         ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true),
                           child: const Text('Exit'),),
                       ],
                     );
                   });
                   if(value!=null){
                     return Future.value(value);

                   }
                   else{
                     return Future.value(false);
                   }
                
                },
                child: fullScreenLoader(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column
                      (crossAxisAlignment: CrossAxisAlignment.center
                      ,
                      children: [
                        model.userdata.roleProfileName != 'QR Validator' ?  Container(
                          padding: EdgeInsets.all(8),
                          height: 250,
                          child: GridView(children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.visitorList);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // Customize the shadow offset
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.people, size: 40, color: Colors.blueAccent,),
                                    AutoSizeText("Visitor", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),),
                                    AutoSizeText("Information", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 13),)
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.productList);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3), // Customize the shadow offset
                                  ),
                                ],
                              ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart,size: 40,color: Colors.blueAccent,),
                                    AutoSizeText("Products",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),)
                                  ],),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.listDesignation);
                              },
                              child: Container(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3), // Customize the shadow offset
                                  ),
                                ],
                              ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person_pin_outlined,size: 40,color: Colors.blueAccent,),
                                    AutoSizeText("Designations",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),)
                                  ],),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.listEventView);
                              },
                              child: Container(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3), // Customize the shadow offset
                                  ),
                                ],
                              ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.event,size: 40,color: Colors.blueAccent,),
                                    AutoSizeText("Event",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),)
                                  ],),
                              ),
                            ),

                            model.userdata.roleProfileName != 'web user' ?
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.teamMemberList);
                              },
                              child: Container(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3), // Customize the shadow offset
                                  ),
                                ],
                              ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person,size: 40,color: Colors.blueAccent,),
                                    AutoSizeText("Team",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),),
                                    AutoSizeText("Members",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),)
                                  ],),
                              ),
                            ):Container()
                          ],

                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3 , mainAxisSpacing: 20, crossAxisSpacing: 20 ),
                          ),

                        ):

                        Container(),

                        const SizedBox(height: 20,),
                        Text('Scan your code here',style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20,) ,),
                         Container(

                          padding: EdgeInsets.all(15),

                          height: 155,
                          child: GridView(children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.attendenceScanner);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // Customize the shadow offset
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.qr_code_2,size: 40,color: Colors.blueAccent,),
                                    Text("Attendance",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),),
                                    Text("QR",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),)
                                  ],),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.tlcGiftScanner);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // Customize the shadow offset
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.qr_code_scanner,size: 40,color: Colors.blueAccent,),
                                    Text("Gift QR",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 13),)
                                  ],),
                              ),
                            ),


                          ],
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3 , mainAxisSpacing: 20, crossAxisSpacing: 20 ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  loader: model.isBusy,
                  context: context,
                ),
              ),
            ));
  }
}
