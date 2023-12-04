import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../model/add_designation_model.dart';

class AddDesignationServices {
  Future<bool> addDesignation(Add_Designation designation) async {
    baseurl = await geturl();
    var data = json.encode({
      "data": designation,
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Event Designation?limit_page_length=999',
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Designation Added Successfully");
        return true;
      }

      else {
        Fluttertoast.showToast(msg: "UNABLE TO add Designation!");
        return false;
      }
    } on DioException catch (e) {

      if (e.response?.statusCode == 409) {
        // Handle 409 Conflict error here
        Fluttertoast.showToast(msg: "Designation Already Exist!",textColor: Colors.red);
        Logger().e("Conflict occurred");
      } else {
        // Handle other DioException cases if needed
        Fluttertoast.showToast(msg: "Error occurred");
        Logger().e("Error occurred");
      }
    } catch (e) {
      // Handle other types of exceptions
      Fluttertoast.showToast(msg: "Unexpected error occurred");
      Logger().e("Unexpected error occurred: $e");

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
        '$baseurl/api/resource/Event Designation?limit_page_length=999/${designation.name.toString()}',
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
      Logger().e(e.hashCode);
    }
    return false;
  }
}
