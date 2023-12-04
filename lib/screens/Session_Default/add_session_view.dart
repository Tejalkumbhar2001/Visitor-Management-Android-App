import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import '../../constants.dart';
import '../../model/eventlist_model.dart';
import '../../widgets/drop_down.dart';
import '../../widgets/full_screen_loader.dart';
import '../../widgets/textfielddecoration.dart';
import 'add_session_model.dart';

class SessionDefault extends StatelessWidget {
  const SessionDefault({Key? key}); // Use Key? instead of super.key

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddSessionModel>.reactive(
      viewModelBuilder: () => AddSessionModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: AlertDialog(
            backgroundColor: Colors.black12,
            title: const Text('Session Default'),
            content: SizedBox(
              height: getHeight(context) / 6,
              child: fullScreenLoader(
                child: Form(
                  key: model.formKey,
                  child: CdropDown(
                    dropdownButton: DropdownButtonFormField<EventList>(
                      menuMaxHeight: 200,
                      isExpanded: true,
                      value: model.selectedEvent,
                      decoration: const InputDecoration(
                        labelText: 'Event',
                      ),
                      hint:  Text(model.event ?? ""),
                      items: model.eventlist.map((val) {
                        return DropdownMenuItem<EventList>(
                          value: val,
                          child: Text(val.eventName ?? ""),
                        );
                      }).toList(),
                      onChanged: model.setsession,
                    ),
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
                onPressed: () {
                  // Add logic to set the selected event as a session default
                  if (model.selectedEvent != null) {
                    // Perform other actions if needed
                    model.onSavedSession(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}