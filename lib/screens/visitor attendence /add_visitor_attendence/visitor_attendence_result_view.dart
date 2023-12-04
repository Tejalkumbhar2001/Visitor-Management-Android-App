import 'package:flutter/material.dart';
import 'package:geolocation/qr_code_scanner.dart';
import 'package:geolocation/router.router.dart';
import 'package:geolocation/screens/visitor%20attendence%20/add_visitor_attendence/visitor_attendence_logic_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';
import '../../../constraint.dart';
import '../../../widgets/text_button.dart';

class AttendenceResultScreen extends StatelessWidget {
  final String code                                                                                                                                                                                                                 ;
  final Function() closeScreen;
  const AttendenceResultScreen({super.key,required this.closeScreen,required this.code});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddAttendenceModel>.reactive(
        viewModelBuilder: () => AddAttendenceModel(),
        onViewModelReady: (model) => model.initialise(context,code),
        builder: (context, model, child) => Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Attendance Result Screen",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            leading: IconButton(onPressed: (){Navigator.popAndPushNamed(context, Routes.homePage);}, icon: const Icon(Icons.arrow_back)),
// leading: IconButton(onPressed: (){
//   Navigator.push(context, MaterialPageRoute(builder: (context)=> const QRCodeScanner()));
// }, icon: Icon(Icons.arrow_back)),
          ),

          body: WillPopScope(
            onWillPop:  () async{
              Navigator.popAndPushNamed(context, Routes.homePage);

              return true; },
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: code,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    const Text(
                      "Scanned result",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$code",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                    ),
                    // Text(
                    //   model.qrcodeextraction.name ?? "",
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     color: Colors.black87,
                    //     fontSize: 10,
                    //     letterSpacing: 1,
                    //   ),
                    // ),
                    // Text(
                    //   model.qrcodeextraction.userName ?? "",
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     color: Colors.black87,
                    //     fontSize: 10,
                    //     letterSpacing: 1,
                    //   ),
                    // ),Text(
                    //   model.qrcodeextraction.email ?? "",
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     color: Colors.black87,
                    //     fontSize: 10,
                    //     letterSpacing: 1,
                    //   ),
                    // ),
                    // Text(
                    //   model.qrcodeextraction.wtspNumber ?? "",
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     color: Colors.black87,
                    //     fontSize: 10,
                    //     letterSpacing: 1,
                    //   ),
                    // ),
                    //
                    // Text(
                    //   model.qrcodeextraction.customCompanyName ?? "",
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     color: Colors.black87,
                    //     fontSize: 10,
                    //     letterSpacing: 1,
                    //   ),
                    // ),



                    Card(
                      elevation: 5, // Adjust the elevation as needed
                      margin: EdgeInsets.all(10), // Adjust the margin as needed
                      child: Padding(
                        padding: EdgeInsets.all(10), // Adjust the padding as needed
                        child: Column(
                          children: [
                            // Text(
                            //   model.qrcodeextraction.name ?? "",
                            //   textAlign: TextAlign.center,
                            //   style: const TextStyle(
                            //     color: Colors.black87,
                            //     fontSize: 10,
                            //     letterSpacing: 1,
                            //   ),
                            // ),
                            Text(
                              model.qrcodeextraction.userName ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              model.qrcodeextraction.email ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              model.qrcodeextraction.wtspNumber ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                             'Company Name: ${model.qrcodeextraction.customCompanyName ?? ""}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CtextButton(
                          onPressed: () {model.onSaved(context);
                          if(model.res=true){
                            showSaveDialog(context);
                          }
                              },
                          text: 'Mark Attendance',
                        ),
                      ],
                    ),




                  ],
                ),
              ),
            ),
          ),
        ));
  }
  void showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.padding),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: contentBox(context),
        );
      },
    );
  }
  Widget contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: Constants.padding,
            top: Constants.avatarRadius + Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding,
          ),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Attendance Marked Successfully',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 22),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    //  Navigator.of(context).pop();
                    Navigator.popAndPushNamed(context,Routes.homePage);
                  },
                  child: Text('OK', style: TextStyle(fontSize: 18, color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: Constants.avatarRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
