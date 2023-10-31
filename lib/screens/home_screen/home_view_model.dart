import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class Homeviewmodel extends BaseViewModel {
  List<String> leadlist = [""];
  String? user;
  String? full_name;
  String? role_profile;

  initialise(BuildContext context) async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    user = prefs.getString("user") ?? "";
    full_name = prefs.getString("full_name") ?? "";
    role_profile = prefs.getString("role_profile") ?? "";

    setBusy(true);
    // leadlist = await homeservices().fetchLead();
    setBusy(false);
  }
}
