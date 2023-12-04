import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/list_member_model.dart';
import 'package:logger/logger.dart';
import '../constants.dart';
import '../model/team_member_model.dart';

class ListMemberServices {


  Future<List<MemberList>> getListByNameFilter(String name) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Add Team Member?fields=["first_name","last_name","company","designation"]&filters=[["first_name","Like","$name%"]]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<MemberList> farmersList = List.from(jsonData['data'])
            .map<MemberList>((data) => MemberList.fromJson(data))
            .toList();
        return farmersList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } catch (e) {
      Logger().e(e);
    }

    return [];
  }
  Future<List<MemberList>> fetchmemberlist() async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Add Team Member?fields=["first_name","last_name","designation","company","name"]',
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



  Future deletemember(String id) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Add Team Member/$id',
        options: Options(
          method: 'DELETE',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return Team_member.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } catch (e) {
      Logger().i(e);
      Fluttertoast.showToast(msg: "Error while fetching member");
    }
    return null;
  }


}
