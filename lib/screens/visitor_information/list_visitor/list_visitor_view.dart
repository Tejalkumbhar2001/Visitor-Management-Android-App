import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/widgets/full_screen_loader.dart';
import 'package:stacked/stacked.dart';

import '../../../router.router.dart';
import 'list_visitor_model.dart';

class VisitorList extends StatelessWidget {
  const VisitorList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<listvisitormodel>.reactive(
        viewModelBuilder: () => listvisitormodel(),
        onViewModelReady: (model) => model.initialise(context),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text("Visitor's List"),
              ),
              body: fullScreenLoader(
                  loader: model.isBusy,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        model.leadlist.isNotEmpty
                            ? Expanded(
                                child: ListView.separated(
                                  itemCount: model.leadlist.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: ListTile(
                                        title: Text(
                                          model.leadlist[index].name ?? '',
                                        ),
                                        subtitle: Text(
                                            model.leadlist[index].leadName ??
                                                ""),
                                      ),
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
                              )
                            : const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("You haven't created a Cane Master yet"),
                                ],
                              )
                      ],
                    ),
                  ),
                  context: context),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.addVisitor);
                },
                child: Icon(Icons.person_add_alt_1),
              ),
            ));
  }
}
