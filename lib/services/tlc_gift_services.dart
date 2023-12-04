import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/visitor_attendence_model.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import '../constants.dart';
import '../constraint.dart';
import '../model/qrcode_extraction_model.dart';
import '../model/tlc_gift_info_model.dart';

class TlcGiftServices {

  Future<bool> addtlcgiftinfo(BuildContext context,TLCGiftAllocationModel visitor) async {
    baseurl= await geturl();
    var data = json.encode({
      "data": visitor,
    });
    Logger().i(visitor.toJson().toString());
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/TLC Gift Information',
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {

       // Fluttertoast.showToast(msg: "Gift Claimed Successfully!",textColor: Colors.green,backgroundColor: Colors.white);
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO add Gift Info!");
        return false;
      }
    } on DioException catch (e) {

      if (e.response?.statusCode == 417) {
        // Handle 409 Conflict error here
      //  Fluttertoast.showToast(msg: "Gift Already Allocated!",textColor: Colors.red,backgroundColor: Colors.black);
        Logger().e(e.response?.data["exception"]);
      } else {
        // Handle other DioException cases if needed
        Fluttertoast.showToast(msg: "Error occurred");
        Logger().e("Error occurred" );
      }
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
