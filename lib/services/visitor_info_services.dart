import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:logger/logger.dart';
import '../constants.dart';

class visitorinfoservices {
  Future<List<String>> fetchevent() async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Events?fields=["name"]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = json.encode(response.data);
        Map<String, dynamic> jsonDataMap = json.decode(jsonData);
        List<dynamic> dataList = jsonDataMap["data"];
        Logger().i(dataList);
        List<String> namesList =
        dataList.map((item) => item["name"].toString()).toList();
        return namesList;
      }

      if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: "Unauthorized Access!");
        return ["401"];
      } else {
        Fluttertoast.showToast(msg: "Unable to Event");
        return [];
      }
    }  on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.response?.data["exception"].toString()} ",
        backgroundColor: Color(0xFFBA1A1A),
        textColor: Color(0xFFFFFFFF),
      );
      Logger().e(e);
    }
    return[];
  }
  Future<List<Product>> fetchProduct() async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Product?fields=["product_name","description", "product_image", "name"]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<Product> caneList = List.from(jsonData['data'])
            .map<Product>((data) => Product.fromJson(data))
            .toList();
        return caneList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch products");
        return [];
      }
    }  on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.response?.data["exception"].toString()} ",
        backgroundColor: Color(0xFFBA1A1A),
        textColor: Color(0xFFFFFFFF),
      );
      Logger().e(e);
    }
    return [];
  }

  Future<visitor_information?> getvisitor(String id) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Information/$id',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return visitor_information.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    }  on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.response?.data["exception"].toString()} ",
        backgroundColor: Color(0xFFBA1A1A),
        textColor: Color(0xFFFFFFFF),
      );
      Logger().e(e);
    }
    return null;
  }

  Future<bool> Updatevisitor(visitor_information visitor) async {
    baseurl= await geturl();
    try {
      // var data = json.encode({farmer});
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Information/${visitor.name.toString()}',
        options: Options(
          method: 'PUT',
          headers: {'Authorization': await getTocken()},
        ),
        data: visitor.toJson(),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Visitor Updated");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO Visitor!");
        return false;
      }
    }  on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.response?.data["exception"].toString()} ",
        backgroundColor: Color(0xFFBA1A1A),
        textColor: Color(0xFFFFFFFF),
      );
      Logger().e(e);
    }
    return false;
  }



  Future<bool> addvisitor(visitor_information visitor) async {
    baseurl= await geturl();
    var data = json.encode({
      "data": visitor,
    });
Logger().i(visitor.toJson().toString());
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Information',
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Visitor Added Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO add Visitor!");
        return false;
      }
    }  on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.response?.data["exception"].toString()} ",
        backgroundColor: Color(0xFFBA1A1A),
        textColor: Color(0xFFFFFFFF),
      );
      Logger().e(e);
    }
    return false;
  }



  Future<visitor_information?> getqrcodeextraction(String id) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/User Registration/$id',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return visitor_information.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    }  on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.response?.data["exception"].toString()} ",
        backgroundColor: Color(0xFFBA1A1A),
        textColor: Color(0xFFFFFFFF),
      );
      Logger().e(e);
    }
    return null;
  }
 }
