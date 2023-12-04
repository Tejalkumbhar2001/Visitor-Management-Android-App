import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../model/user_model.dart';

class HomeServices {

  Future<UserModel?> getUser(String name) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/method/visitor_management.mobile_env.app.get_user_document?user_name=$name',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        //Logger().i(response.data["message"]);
        return UserModel.fromJson(response.data["message"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } catch (e) {
      Logger().i(e);
      Fluttertoast.showToast(msg: "Error while fetching user");
    }
    return null;
  }

}
