import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/widgets/full_screen_loader.dart';
import 'package:stacked/stacked.dart';

import 'list_visitor_model.dart';

class VisitorList extends StatelessWidget {
  const VisitorList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<listvisitormodel>.reactive(
        viewModelBuilder: () => listvisitormodel(),
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
