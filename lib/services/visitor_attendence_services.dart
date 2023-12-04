import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/visitor_attendence_model.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import '../constants.dart';
import '../constraint.dart';
import '../model/qrcode_extraction_model.dart';

class VisitorAttendanceServices {
  Future<bool> addvisitorattendence(VisitorAttendence visitor) async {
    baseurl= await geturl();
    var data = json.encode({
      "data": visitor,
    });
    Logger().i(visitor.toJson().toString());
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Attendance',
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
       // Fluttertoast.showToast(msg: "Attendence marked successfully.",backgroundColor: Colors.green,textColor: Colors.white,fontSize: 15,gravity: ToastGravity.CENTER);
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO add Visitor attendance!");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }

  Future<QrCodeExtraction?> getqrcodeextraction(String url) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/User Registration/$url',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return QrCodeExtraction.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } catch (e) {
      Logger().i(e);
      Fluttertoast.showToast(msg: "Error while fetching visitor attendance");
    }
    return null;
  }



}
