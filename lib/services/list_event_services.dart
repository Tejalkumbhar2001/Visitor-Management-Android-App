import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../model/eventlist_model.dart';

class ListEventServices {


  Future<List<EventList>> getListByNameFilter(String name) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Events?fields=["event_name","starts_on","ends_on","status","location","name"]&filters=[["event_name","Like","$name%"]]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<EventList> farmersList = List.from(jsonData['data'])
            .map<EventList>((data) => EventList.fromJson(data))
            .toList();
        return farmersList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    }catch (e) {
      Logger().e(e);
    }

    return [];
  }

  Future<List<EventList>> fetchEvent() async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Events?fields=["event_name","starts_on","ends_on","status","location","name"]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<EventList> farmersList = List.from(jsonData['data'])
            .map<EventList>((data) => EventList.fromJson(data))
            .toList();
        return farmersList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch Event");
        return [];
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(msg: "Unauthorized Event!");
      return [];
    }
  }
}
