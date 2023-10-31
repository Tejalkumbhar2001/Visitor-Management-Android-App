import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';

import '../../../router.router.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import 'list_member_model.dart';

class TeamMemberList extends StatelessWidget {
  const TeamMemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListTeamMemberModel>.reactive(
        viewModelBuilder: () => ListTeamMemberModel(),
        onViewModelReady: (model) => model.initialise(context),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Member List"),
              ),
              body: fullScreenLoader(
                  loader: model.isBusy,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        model.memberlist.isNotEmpty
                            ? Expanded(
                                child: RefreshIndicator(
                                  onRefresh: model.refreshList,
                                  child: ListView.separated(
                                    itemCount: model.memberlist
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 10.0),
                                                child: ListTile(
                                                  selectedTileColor:
                                                      Colors.blueAccent,
                                                  leading: const CircleAvatar(
                                                    backgroundColor: Colors
                                                        .blue, // Set your desired color
                                                    child: Icon(
                                                        Bootstrap.person_fill,
                                                        color: Colors
                                                            .white), // Icon with white color
                                                  ),
                                                  title: AutoSizeText(
                                                    "${model.memberlist[index].firstName ?? ""} ${model.memberlist[index].lastName ?? ""}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .factory_outlined,
                                                            size: 16,
                                                            color: Colors.green,
                                                          ),
                                                          const SizedBox(
                                                              width: 5),
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              model
                                                                      .memberlist[
                                                                          index]
                                                                      .company ??
                                                                  "",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          14),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .person_pin_outlined,
                                                            size: 16,
                                                            color: Colors.green,
                                                          ),
                                                          const SizedBox(
                                                              width: 5),
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              model
                                                                      .memberlist[
                                                                          index]
                                                                      .designation ??
                                                                  "",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: const Icon(FontAwesome
                                                      .arrow_right), // Arrow icon at the end
                                                  onTap: () {
                                                    model.onRowClick(
                                                        context,
                                                        model
                                                            .memberlist[index]);
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
                            : Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "You haven't created a Team Member yet"),
                                    CtextButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, Routes.addTeamMember,
                                            arguments:
                                                const AddTeamMemberArguments(
                                                    memberid: ""));
                                      },
                                      text: 'Create Team Member',
                                    )
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                  context: context),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.background,
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.addTeamMember,
                      arguments: const AddTeamMemberArguments(memberid: ""));
                },
                child: const Icon(Icons.person_add_alt_1),
              ),
            ));
  }
}
