import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/constants.dart';
import 'package:logger/logger.dart';

import '../model/leadmodel.dart';

class homeservices {
  Future<List<Leadmodel>> fetchLead() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Lead?fields=["lead_name","name"]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<Leadmodel> caneList = List.from(jsonData['data'])
            .map<Leadmodel>((data) => Leadmodel.fromJson(data))
            .toList();
        return caneList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch Lead");
        return [];
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(msg: "Unauthorized Lead!");
      return [];
    }
  }
}
