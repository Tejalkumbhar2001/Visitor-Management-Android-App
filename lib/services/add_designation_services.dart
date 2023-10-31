import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../model/add_designation_model.dart';

class AddDesignationServices {
  Future<bool> addDesignation(Add_Designation designation) async {
    var data = json.encode({
      "data": designation,
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        apiaddDesignation,
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Designation Added Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO add Designation!");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }

  Future<bool> updateDesignation(Add_Designation designation) async {
    var data = json.encode({
      "data": designation,
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Designations/${designation.name.toString()}',
        options: Options(
          method: 'PUT',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Designation updated Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO update Designation!");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }
}
