import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/product_model.dart';
import 'package:logger/logger.dart';

import '../constants.dart';

class ListProductServices {


  Future<List<Product>> getListByNameFilter(String name) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Product?fields=["product_name","description","product_image","name"]&filters=[["product_name","Like","$name%"]]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<Product> farmersList = List.from(jsonData['data'])
            .map<Product>((data) => Product.fromJson(data))
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

  Future<List<Product>> fetchProduct() async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Product?fields=["product_name","name","product_image","description"]',
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
        Fluttertoast.showToast(msg: "Unable to fetch Product");
        return [];
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(msg: "Unauthorized Product!");
      return [];
    }
  }
}
