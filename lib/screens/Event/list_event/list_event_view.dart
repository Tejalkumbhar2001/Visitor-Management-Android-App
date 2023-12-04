import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import '../../../router.router.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/textfielddecoration.dart';
import 'list_event_model.dart';

class ListEventView extends StatelessWidget {
  const ListEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListEventModel>.reactive(
      viewModelBuilder: () => ListEventModel(),
      onViewModelReady: (model) => model.initialise(context),
            builder: (context, model, child) => Scaffold(
             appBar: AppBar(
              title: const Text("Event List"),
              leading: IconButton(onPressed: (){Navigator.popAndPushNamed(context, Routes.homePage);}, icon: Icon(Icons.arrow_back)),
        ),
            body:  WillPopScope(
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
                        model.eventfilterleadlist.isNotEmpty
                            ? Expanded(
                          child: RefreshIndicator(
                            onRefresh: model.refreshList,
                            child: ListView.separated(
                              itemCount: model.eventfilterleadlist
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
                                                  Bootstrap.calendar_event,
                                                  color: Colors
                                                      .white), // Icon with white color
                                            ),
                                            title: AutoSizeText(
                                              'Event Name: ${model.eventfilterleadlist[index].eventName ?? ""}',
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
                                                            .calendar_month,
                                                        size: 16,
                                                        color: Colors
                                                            .green), // Business icon
                                                    SizedBox(width: 5),
                                                    AutoSizeText(
                                                      ' ${DateFormat('yyyy-MMM-dd').format(DateTime.parse((model.eventfilterleadlist[index].startsOn ?? "")))}',
                                                      style: TextStyle(
                                                          fontSize: 10),overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Icon(Icons.calendar_month,
                                                        size: 16,
                                                        color: Colors
                                                            .blue), // Phone icon
                                                    SizedBox(width: 5),
                                                    AutoSizeText(
                                                      '${model.eventfilterleadlist[index].status ?? ""}',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            trailing: Icon(FontAwesome
                                                .arrow_right), // Arrow icon at the end
                                            onTap: () {
                                              model.onRowClick(context,
                                                  model.eventfilterleadlist[index]);
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
                                    "You haven't created Event yet")),
                            CtextButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, Routes.addEventScreen,
                                    arguments:
                                    const AddEventScreenArguments(
                                        eventid: ""));
                              },

                              text: 'Create Event',
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
                  Navigator.popAndPushNamed(context, Routes.addEventScreen,
                      arguments: const AddEventScreenArguments(eventid: ""));
                },
                child: const Icon(Icons.event),
              ),

            ));
        }
}
