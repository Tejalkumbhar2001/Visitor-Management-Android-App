import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:logger/logger.dart';
import '../constants.dart';
import '../model/qrcode_extraction_model.dart';

class QrCodeExtractionServices {

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
      Fluttertoast.showToast(msg: "Error while fetching qrcode");
    }
    return null;
  }
}
