import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class Homeviewmodel extends BaseViewModel {
  List<String> leadlist = [""];
  String? user;
  String? full_name;

  initialise(BuildContext context) async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    user = prefs.getString("user") ?? "";
    full_name = prefs.getString("full_name") ?? "";

    setBusy(true);
    // leadlist = await homeservices().fetchLead();
    setBusy(false);
  }
}
