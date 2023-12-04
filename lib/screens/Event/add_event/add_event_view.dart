import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:geolocation/screens/Event/add_event/add_event_model.dart';
import 'package:stacked/stacked.dart';
import '../../../router.router.dart';
import '../../../widgets/drop_down.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/textfielddecoration.dart';

class AddEventScreen extends StatefulWidget {
  final String eventid;
  const AddEventScreen({super.key, required this.eventid});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventModel>.reactive(
        viewModelBuilder: () => EventModel(),
        onViewModelReady: (model) => model.initialise(context, widget.eventid),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: const Text('Event'),
            ),
            body: WillPopScope(
              onWillPop: ()  async{
                Navigator.popAndPushNamed(context, Routes.listEventView);
                return true; },
              child: fullScreenLoader(
                child: SingleChildScrollView(
                    child: Form(
                        key: model.formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            TextFormField(
                              controller: model.eventNamecontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Event Name',
                                  hintText: 'golden jubilee',
                                  prefixIcon: Icons.event),
                              onChanged: model.seteventName,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter a Event Name'
                                  : null,
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            // TextFormField(
                            //     controller: model.startsOncontroller,
                            //     decoration:
                            //     AppInputDecorations.textFieldDecoration(
                            //         labelText: 'Start Date',
                            //         hintText: '12/11/23',
                            //         prefixIcon: Icons.date_range_outlined),
                            //     onChanged: model.setstartsOn,
                            //     validator: (value) => value!.isEmpty
                            //         ? 'Please enter a Start Date'
                            //         : null),

                            TextFormField(
                              controller: model.startsOncontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Start Date',
                                hintText: '12/11/23',
                                prefixIcon: Icons.date_range,
                              ),
                              onTap:  () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2050, 12, 31),
                                  onConfirm: (date) {
                                    // Handle the selected date
                                    model.setstartsOn(date.toString());
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                              onChanged: model.setstartsOn,
                              validator: (value) => value!.isEmpty ? 'Please enter a Start Date' : null,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.endsOncontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'End Date',
                                hintText: '12/11/23',
                                prefixIcon: Icons.date_range,
                              ),
                              onTap:  () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2100, 12, 31),
                                  onConfirm: (date) {
                                    // Handle the selected date
                                    model.setendsOn(date.toString());
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                              onChanged: model.setendsOn,
                              validator: (value) => value!.isEmpty ? 'Please enter a End Date' : null,
                            ),



                            const SizedBox(
                              height: 15,
                            ),

                            CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                isExpanded: true,
                                value: model.eventdata.status,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Event Status',
                                ),
                                hint: const Text('Select Event Status'),
                                items: model.statuslist.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: AutoSizeText(val),
                                  );
                                }).toList(),
                                onChanged: model.setstatus,
                               // validator: model.validaterole,
                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            TextFormField(
                              controller: model.locationcontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Location',
                                  hintText: 'Sangli',
                                  prefixIcon: Icons.location_on),
                              onChanged: model.setlocation,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter a Event Location'
                                  : null,
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CtextButton(
                                    onPressed: () => model.onsaved(context),
                                    text: 'Save',
                                  ),
                                  CtextButton(
                                    text: 'Cancel',
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                          ]),
                        ))),
                loader: model.isBusy,
                context: context,
              ),
            )));
  }
}
