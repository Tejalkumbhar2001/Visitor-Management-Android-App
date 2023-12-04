import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocation/widgets/textfielddecoration.dart';
import 'package:stacked/stacked.dart';
import '../../constants.dart';
import '../../widgets/full_screen_loader.dart';
import 'list_designation_model.dart';

class ListDesignation extends StatelessWidget {
  const ListDesignation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListDesignationModel>.reactive(
      viewModelBuilder: () => ListDesignationModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Designations'),
        ),
        body: fullScreenLoader(
          child:
               Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                  ),

                  model.designationfilterleadlist.isNotEmpty
                  ?Expanded(
                    child: RefreshIndicator(
                        onRefresh: model.refreshlist,
                        child: ListView.builder(
                          itemCount: model.designationfilterleadlist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 3, // Card elevation for a shadow effect
                              margin:
                                  const EdgeInsets.all(8), // Margin around the card
                              child: ListTile(
                                leading: Icon(Icons.person_pin_outlined),
                                title: Text(model.designationfilterleadlist[index].name ?? ""),
                              ),
                            );
                          },
                        ),
                      ),
                  )
                : Center(
            child: Text("You haven't created a Designation yet"),
                  ) ],


              ),
      loader: model.isBusy,
      context: context,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addDesignation(context, model);
          },
          child: Icon(Icons.person_add),
        ),
      ),
    );
  }
}

addDesignation(BuildContext context, ListDesignationModel model) {
  model.resetBankVariables();
  SchedulerBinding.instance.addPostFrameCallback(
    (_) {
      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) setState) {
            return AlertDialog(
              title: const Text('Add Designation'),
              content: SizedBox(
                height: getHeight(context) / 8,
                child: fullScreenLoader(
                  child: Form(
                    key: model.formKey,
                    child: TextFormField(
                      initialValue: model.designationdata.designationName,
                      decoration: AppInputDecorations.textFieldDecoration(
                          labelText: 'Designation',
                          hintText: 'Director',
                          prefixIcon: Icons.person_pin_outlined),
                      onChanged: model.setdesignation,
                    ),
                  ),
                  loader: model.isBusy,
                  context: context,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => model.onSavedDesigantion(context),
                  child: const Text('Add'),
                ),
              ],
            );
          });
        },
      );
    },
  );
}
