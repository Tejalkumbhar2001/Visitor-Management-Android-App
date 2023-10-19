import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/services/login_services.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../../router.router.dart';

class LoginViewModel extends BaseViewModel {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool obscurePassword = true;
  bool isloading = false;
  initialise() {}

  void loginwithUsernamePassword(BuildContext context) async {
    isloading = true;
    notifyListeners();
    String username = usernameController.text;
    String password = passwordController.text;
    Logger().i(username);
    Logger().i(password);
    bool res = await loginservices().login(username, password);
    isloading = false;
    notifyListeners();
    if (res) {
      if (true) {
        if (context.mounted) {
          Navigator.popAndPushNamed(context, Routes.homePage);
        }
      }
    } else {
      Logger().i('invalid credential');
      Fluttertoast.showToast(
          msg: "Invalid Credentials",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
    // if (res) {
    //   if (true) {
    //   if (context.mounted) {
    //     Navigator.popAndPushNamed(context, Routes.homePage);
    //   }
    // } }else {
    //     Logger().i(password);
    //   }
    //   // Fluttertoast.showToast(
    //   //     msg: "Invalid Credentials",
    //   //     toastLength: Toast.LENGTH_LONG,
    //   //     gravity: ToastGravity.BOTTOM,
    //   //     timeInSecForIosWeb: 1,
    //   //     backgroundColor: Colors.white,
    //   //     textColor: Colors.black,
    //   //     fontSize: 16.0);
    // }
  }

  String? validateUsername(username) {
    if (username.toString().isEmpty) {
      return "Enter a valid username";
    }
    return null;
  }

  String? validatePassword(password) {
    if (password.toString().isEmpty) {
      return "Enter a Password";
    }
    return null;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
