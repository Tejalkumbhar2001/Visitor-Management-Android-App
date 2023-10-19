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
            body: fullScreenLoader(
                loader: model.isBusy,
                child: Column(
                  children: [],
                ),
                context: context)));
  }
}
