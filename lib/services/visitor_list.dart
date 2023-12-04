import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import '../constants.dart';
import '../model/visitor_list_model.dart';

class Visitorlistservices {

  Future<List<visitor_list>> getListByNameFilter(String name) async {
    baseurl= await geturl();
    String? event = await getevent();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Information?fields=["company","whatsapp_no","first_name","name"]&filters=[["first_name","Like","$name%"],["event","Like","$event%"]]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<visitor_list> farmersList = List.from(jsonData['data'])
            .map<visitor_list>((data) => visitor_list.fromJson(data))
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

  Future<List<visitor_list>> fetchLead() async {
    baseurl= await geturl();
    String? event = await getevent();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Information?fields=["company","whatsapp_no","first_name","name"]&filters=[["event","Like","$event%"]]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<visitor_list> caneList = List.from(jsonData['data'])
            .map<visitor_list>((data) => visitor_list.fromJson(data))
            .toList();
        return caneList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch Visitors");
        return [];
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(msg: "Unauthorized Visitors!");
      return [];
    }
  }
}
