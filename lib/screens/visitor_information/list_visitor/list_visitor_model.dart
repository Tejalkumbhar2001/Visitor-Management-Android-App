import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../model/leadmodel.dart';
import '../../../services/home_services.dart';

class listvisitormodel extends BaseViewModel {
  List<Leadmodel> leadlist = [];
  initialise(BuildContext context) async {
    setBusy(true);
    leadlist = await homeservices().fetchLead();
    setBusy(false);
  }
}
