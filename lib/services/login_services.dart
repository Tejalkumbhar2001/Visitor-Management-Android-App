import 'package:dio/dio.dart';

import 'package:geolocation/constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginservices {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> login(String url,String username, String password) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
   // var data = {'usr': 'payalkumbhar@gmail.com', 'pwd': 'payal@321'};
    var data = {'usr': username, 'pwd': password};
    var dio = Dio();

    try {
      var response = await dio.request(
        '$url/api/method/visitor_management.mobile_env.app.login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      Logger().i(data.toString());
      if (response.statusCode == 200) {
        final SharedPreferences prefs = await _prefs;
        Logger().i(response.data.toString());
        prefs.setString("url", url);
        prefs.setString("api_secret",
            response.data["key_details"]["api_secret"].toString());
        prefs.setString(
            "api_key", response.data["key_details"]["api_key"].toString());
        prefs.setString("user", response.data["user"].toString());
        prefs.setString(
            "role_profile", response.data["role_profile"].toString());
        prefs.setString("employee_id", response.data["employee_id"].toString());
        prefs.setString("full_name", response.data["full_name"].toString());
        Logger().i(response.data["key_details"]["api_secret"].toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Logger().e('Error occurred during login request: $e');
      return false;
    }
  }
}
