import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/full_screen_loader.dart';
import 'add_visitor_model.dart';

class AddVisitor extends StatelessWidget {
  const AddVisitor({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Addvisitormodel>.reactive(
        viewModelBuilder: () => Addvisitormodel(),
        onViewModelReady: (model) => model.initialise(context),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Visitor's Form"),
            ),
            body: fullScreenLoader(
                loader: model.isBusy,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: model.name,
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          hintText: 'DD-MM-YYYY',
                        ),
                        validator: model.validateName,
                        onChanged: model.setSelectedName,
                      ),
                    ],
                  ),
                ),
                context: context)));
  }
}
