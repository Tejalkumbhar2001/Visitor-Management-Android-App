import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import '../constants.dart';
import '../model/designation_model.dart';

class ListDesignationServices {

  Future<List<Designation>> getListByNameFilter(String name) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Event Designation?fields=["name"]&filters=[["name","Like","$name%"]]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<Designation> farmersList = List.from(jsonData['data'])
            .map<Designation>((data) => Designation.fromJson(data))
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

  Future<List<Designation>> fetchDesignation() async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Event Designation?limit_page_length=999',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<Designation> designationList = List.from(jsonData['data'])
            .map<Designation>((data) => Designation.fromJson(data))
            .toList();
        return designationList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch Designation");
        return [];
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(msg: "Unauthorized Designation!");
      return [];
    }
  }
}
