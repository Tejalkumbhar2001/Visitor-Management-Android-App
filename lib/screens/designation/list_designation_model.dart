import 'package:flutter/cupertino.dart';
import 'package:geolocation/model/add_designation_model.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../model/designation_model.dart';
import '../../services/add_designation_services.dart';
import '../../services/designation_list_services.dart';

class ListDesignationModel extends BaseViewModel {
  List<Designation> designationlist = [];
  final formKey = GlobalKey<FormState>();
  bool isEdit = true;

  Add_Designation designationdata = Add_Designation();

  Future<void> initialise(BuildContext context) async {
    setBusy(true);
    designationlist = await ListDesignationServices().fetchDesignation();
    Logger().i(designationlist);
    setBusy(false);
  }

  void onSavedDesigantion(
    BuildContext context,
  ) async {
    setBusy(true);
    if (formKey.currentState!.validate()) {
      Logger().i(designationdata.toJson().toString());
      bool res = false;
      res = await AddDesignationServices().addDesignation(designationdata);
      if (res) {
        if (context.mounted) {
          setBusy(false);
          setBusy(false);
          Navigator.of(context);
        }
      }
    }
    designationlist = await ListDesignationServices().fetchDesignation();
    setBusy(false);
  }

  Future<void> refreshlist() async {
    designationlist = await ListDesignationServices().fetchDesignation();
    notifyListeners();
  }

  void resetBankVariables() {
    designationdata.designationName = "";
    notifyListeners();
  }

  void setvariable(String? designation) {
    designationdata.designationName = designation;
    notifyListeners();
  }

  void setdesignation(String? desigantion) {
    designationdata.designationName = desigantion;
    notifyListeners();
  }
}
