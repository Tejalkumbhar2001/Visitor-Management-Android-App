import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocation/constants.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:geolocation/router.router.dart';
import 'package:geolocation/widgets/drop_down.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../../../model/eventlist_model.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/textfielddecoration.dart';
import 'add_visitor_model.dart';
//
// class AddVisitor extends StatefulWidget {
//   final String visitorid;
//   const AddVisitor({super.key, required this.visitorid});
//
//   @override
//   State<AddVisitor> createState() => _AddVisitorState();
// }

class AddVisitor extends StatefulWidget {
  final String visitorid;
  final Map<String, String> dataMap;

  const AddVisitor({Key? key, required this.visitorid, required this.dataMap});

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}


class _AddVisitorState extends State<AddVisitor> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddVisitorModel>.reactive(
        viewModelBuilder: () => AddVisitorModel(),
        onViewModelReady: (model) =>
            model.initialise(context, widget.visitorid,widget.dataMap),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: model.isEdit == true
                  ? Text(model.visitordata.name.toString())
                  : const Text("Visitor's Form"),
            ),
            body: WillPopScope(
              onWillPop: () async{
                Navigator.popAndPushNamed(context, Routes.visitorList);
                return true;
              },
              child: fullScreenLoader(
                  loader: model.isBusy,
                  child: SingleChildScrollView(
                    child: Form(
                      key: model.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: model.firstnamecontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Name',
                                hintText: 'John Snow',
                                prefixIcon: Icons.person,
                              ),
                              onChanged: model.setSelectedName,
                              validator: model.validateName,
                              // When the field is submitted, move focus to the next field
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.agecontroller,
                              keyboardType: TextInputType.number,

                              decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Age',
                                hintText: '12',
                                prefixIcon: Icons.person_sharp,
                              ),
                              onChanged: model.setage,
                              validator: model.validateage,
                              // Add validation logic and controller as needed
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Address',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.villagecontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Address Line1',
                                  hintText: 'address',
                                  prefixIcon: Icons.location_on_outlined),
                              onChanged: model.setaddressline,
                              validator: model.validateaddress,
                              // Add validation logic and controller as needed
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.talukacontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Address Line2',
                                  hintText: 'address',
                                  prefixIcon: Icons.location_on_outlined),
                              onChanged: model.setaddressline2,
                              // validator: model.validateaddress,
                              // Add validation logic and controller as needed
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: model.pincodecontroller,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        AppInputDecorations.textFieldDecoration(
                                            labelText: 'Pincode',
                                            hintText: '001011',
                                            prefixIcon: Icons.numbers_sharp),
                                    onChanged: model.setpinocde,
                                    // validator: model.validatepincode,
                                    // Add validation logic and controller as needed
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: model.statecontroller,
                                    decoration:
                                        AppInputDecorations.textFieldDecoration(
                                            labelText: 'State',
                                            hintText: 'maharashtra',
                                            prefixIcon:
                                                Icons.location_on_outlined),
                                    onChanged: model.setstate,

                                    // Add validation logic and controller as needed
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Contact',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.whatsappcontroller,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'WhatsApp Number',
                                  hintText: '0123456789',
                                  prefixIcon: FontAwesome.whatsapp),
                              onChanged: model.setwhatsapp,
                              validator: model.validateMobileNumber,
                              // Add validation logic and controller as needed
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Email',
                                  hintText: 'example@gmail.com',
                                  prefixIcon: Icons.email),
                              onChanged: model.setemail,
                              validator: model.validateemail,
                              // Add validation logic and controller as needed
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Professional Details',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.comanynamecontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Comapany Name',
                                  hintText: 'Apple',
                                  prefixIcon: Icons.factory),
                              onChanged: model.setcomapany,
                              validator: model.validateComapny,
                              // Add validation logic and controller as needed
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                isExpanded: true,
                                value: model.visitordata.designation,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Designation',
                                ),
                                hint: const Text('Select Designation'),
                                items: model.designationlist.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: AutoSizeText(val),
                                  );
                                }).toList(),
                                onChanged: model.setdesignation,
                                validator: model.validatedesignation,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CtextButton(
                              onPressed: () => addProductDialog(context, model),
                              text: 'Add Products',
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            (model.products.isEmpty)
                                ? const SizedBox()
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: getWidth(
                                          context), // Set your desired width
                                      child: DataTable(
                                        columnSpacing: 22.0,
                                        border: TableBorder.all(width: 0.5),
                                        columns: const [
                                          DataColumn(
                                            label: Text(
                                              'Product Name',
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text('Description'),
                                          ),
                                          DataColumn(
                                            label: Text('Delete'),
                                            numeric: false,
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          model.products.length,
                                          (int index) => DataRow(
                                            cells: [
                                              DataCell(Text(
                                                model.products[index].productName
                                                    .toString(),
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                maxLines: 2,
                                              )),
                                              DataCell(Text(
                                                model.products[index].description
                                                    .toString(),
                                                maxLines: 2,
                                              )),
                                              DataCell(IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Confirm Delete'),
                                                        content: const Text(
                                                            'Are you sure you want to delete this entry?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              // Perform the delete operation
                                                              model.deleteVisitor(
                                                                  index);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Delete'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: const Icon(Icons.delete),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 15,
                            ),
                            CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                isExpanded: true,
                                value: model.visitordata.event,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Event',
                                ),
                                hint: const Text('Select Event'),
                                items: model.eventlist.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: AutoSizeText(val),
                                  );
                                }).toList(),
                                onChanged: model.setEvent,

                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              maxLines: 2,
                              controller: model.feedbackcontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Feedback',
                                  hintText: 'feedback',
                                  prefixIcon: Icons.feedback),
                              onChanged: model.setfeedback,

                              // Add validation logic and controller as needed
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CtextButton(
                                  onPressed: () => model.onSaved(context),
                                  text: 'Save',
                                ),
                                CtextButton(
                                  text: 'Cancel',
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  context: context),
            )));
  }


  addProductDialog(BuildContext context, AddVisitorModel model) {
    // if (model.isEdit == true){
    //   model.setvariables();
    // }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return AlertDialog(
                  title: const Text('Products'),
                  content: Column(
                    children: model.productList.map((product) {
                      return CheckboxListTile(
                        title: Text(product.productName ?? ""),
                        value: model.selectedproduct.contains(product),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              if (!model.selectedproduct.contains(product)) {
                                model.selectedproduct.add(product);
                              }
                            } else {
                              model.selectedproduct.remove(product);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  actions: <Widget>[
                    CtextButton(
                      onPressed: () {
                        model.products.clear();
                        Navigator.of(context).pop();

                        // Clear model.products if model.selectedproduct is empty
                        if (model.selectedproduct.isNotEmpty) {
                          // Call the addProduct function to add selected products to model.products
                          for (var product in model.selectedproduct) {
                            model.addProduct(product.productName);
                          }
                        }
                      },
                      text: 'Add Products',
                    ),
                  ],
                );
              });
        },
      );
    });
  }

// void _showDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Select Products'),
  //         content: Column(
  //           children: products.map((product) {
  //             return CheckboxListTile(
  //               title: Text(product.name),
  //               value: product.isChecked,
  //               onChanged: (bool? value) {
  //                 setState(() {
  //                   product.isChecked = value!;
  //                   if (value) {
  //                     selectedProducts.add(product);
  //                   } else {
  //                     selectedProducts.remove(product);
  //                   }
  //                 });
  //               },
  //             );
  //           }).toList(),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Add to Table'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               _addToChildTable();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
