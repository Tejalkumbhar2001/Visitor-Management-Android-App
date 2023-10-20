import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class Addvisitormodel extends BaseViewModel {
  String name = "";
  initialise(BuildContext context) {}

  void setSelectedName(String? plant) {
    notifyListeners();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter PAN number';
    }

    // Additional validation rules can be added if needed.
    return null;
  }
}
