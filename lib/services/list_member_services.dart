import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/list_member_model.dart';
import 'package:logger/logger.dart';
import '../constants.dart';

class ListMemberServices {
  Future<List<MemberList>> fetchmemberlist() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        apilistmember,
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<MemberList> caneList = List.from(jsonData['data'])
            .map<MemberList>((data) => MemberList.fromJson(data))
            .toList();
        return caneList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch Members");
        return [];
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(msg: "Unauthorized Members!");
      return [];
    }
  }
}
