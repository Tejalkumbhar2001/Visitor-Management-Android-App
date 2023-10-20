import 'package:flutter/cupertino.dart';
import 'package:geolocation/router.router.dart';
import 'package:shared_preferences/shared_preferences.dart';

getHeight(context) => (MediaQuery.of(context).size.height);
getWidth(context) => (MediaQuery.of(context).size.width);

const baseurl = 'https://mobilecrm.erpdata.in';

///functions
Future<String> getTocken() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? api_secret = prefs.getString("api_secret") ?? "";
  String? api_key = prefs.getString("api_key") ?? "";

  String formattedString = 'token $api_key:$api_secret';
  return formattedString;
}

Future<String> getUser() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? user = prefs.getString("user") ?? "";

  return user;
}

Future<String> getEmpId() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? employee_id = prefs.getString("employee_id") ?? "";

  return employee_id;
}

Future<String> getname() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? full_name = prefs.getString("full_name") ?? "";

  return full_name;
}

void logout(BuildContext context) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  prefs.clear();
  if (context.mounted) {
    Navigator.pushNamed(context, Routes.loginViewScreen);
  }
}
