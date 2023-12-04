import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/widgets/full_screen_loader.dart';
import 'package:geolocation/widgets/text_button.dart';
import 'package:geolocation/widgets/textfielddecoration.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';
import '../../../constants.dart';
import '../../../router.router.dart';
import 'list_visitor_model.dart';

class VisitorList extends StatelessWidget {
   const VisitorList({
    super.key,
  });

  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<listvisitormodel>.reactive(
        viewModelBuilder: () => listvisitormodel(),
        onViewModelReady: (model) => model.initialise(context),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Visitor Information"),
                leading: IconButton(onPressed: (){Navigator.popAndPushNamed(context, Routes.homePage);}, icon: Icon(Icons.arrow_back)),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.pushNamed(context, Routes.qRCodeScanner);
                  }, icon: Icon(Icons.qr_code_scanner))
                ],
              ),
              body: WillPopScope(
                onWillPop: ()  async{
                  Navigator.popAndPushNamed(context,Routes.homePage);
                  return true; },
                child: fullScreenLoader(
                    loader: model.isBusy,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: TextField(
                              onChanged: (value) {
                                model.namecontroller.text = value;
                                model.filterListByName(
                                    name: value);
                              },
                              decoration: AppInputDecorations.textFieldDecoration(labelText: "Search Name", hintText: "Name", prefixIcon: Icons.search)
                            ),
                          ),
                          model.filterleadlist.isNotEmpty
                              ? Expanded(
                                  child: RefreshIndicator(
                                    onRefresh: model.refreshleadlist,
                                    child: ListView.separated(
                                      itemCount: model.filterleadlist
                                          .length, // Replace with your actual item count
                                      itemBuilder: (context, index) {
                                        return LayoutBuilder(
                                          builder: (context, constraints) {
                                            return SizedBox(
                                              // Specify your desired fixed height
                                              child: Card(
                                                elevation: 5,
                                                margin: const EdgeInsets.all(10),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 10.0),
                                                  child: ListTile(
                                                    selectedTileColor:
                                                        Colors.blueAccent,
                                                    leading: CircleAvatar(
                                                      backgroundColor: Colors
                                                          .blue, // Set your desired color
                                                      child: Icon(
                                                          Bootstrap.person_fill,
                                                          color: Colors
                                                              .white), // Icon with white color
                                                    ),
                                                    title: AutoSizeText(
                                                      'Name: ${model.filterleadlist[index].firstName ?? ""}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 5),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .factory_outlined,
                                                                size: 16,
                                                                color: Colors
                                                                    .green), // Business icon
                                                            SizedBox(width: 5),
                                                            AutoSizeText(
                                                              '${model.filterleadlist[index].company ?? ""}',
                                                              style: TextStyle(
                                                                  fontSize: 10),overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5),
                                                        Row(
                                                          children: [
                                                            Icon(Icons.phone,
                                                                size: 16,
                                                                color: Colors
                                                                    .blue), // Phone icon
                                                            SizedBox(width: 5),
                                                            AutoSizeText(
                                                              '${model.filterleadlist[index].whatsappNo ?? ""}',
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    trailing: Icon(FontAwesome
                                                        .arrow_right), // Arrow icon at the end
                                                    onTap: () {
                                                      model.onRowClick(context,
                                                          model.filterleadlist[index]);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },

                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          color:
                                              Colors.black87, // Color of the line
                                          thickness: 0, // Thickness of the line
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Center(
                                        child: Text(
                                            "You haven't created a Visitor yet")),
                                    CtextButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, Routes.addVisitor,
                                            arguments:  AddVisitorArguments(
                                                visitorid: "", dataMap: {}));
                                      },

                                      text: 'Create Visitor',
                                    )
                                  ],
                                )
                        ],
                      ),
                    ),
                    context: context),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.background,
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.addVisitor,
                      arguments: AddVisitorArguments(visitorid: "", dataMap: {}));
                },
                child: const Icon(Icons.person_add_alt_1),
              ),
            ));
  }


}
