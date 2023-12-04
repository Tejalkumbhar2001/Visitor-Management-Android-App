import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/product_model.dart';
import 'package:logger/logger.dart';
import '../constants.dart';

class ProductServices {



  Future<String> uploadDocs(File? file) async {
    baseurl= await geturl();
    if (file == null) {
      return "";
    }
    try {
      FormData data = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: generateUniqueFileName(file),
        ),
      });
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/method/upload_file',
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Logger().i(json.encode(response.data));
        String jsonString = json
            .encode(response.data); // Convert the response.data to JSON string
        Map<String, dynamic> jsonResponse = json.decode(jsonString);

// Extract the "file_url" from the jsonResponse
        String fileUrl = jsonResponse["message"]["file_url"];
        return fileUrl;
      } else {
        Logger().i(response.statusMessage);
      }
    } catch (e) {
      Logger().e(e);
    }

    return "";
  }

  Future<bool> addproduct(Product product) async {
    baseurl= await geturl();
    var data = json.encode({
      "data": product,
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Product',
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Product Added Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO add Product!");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }

  Future<bool> updateproduct(Product product) async {
    baseurl= await geturl();
    var data = json.encode({
      "data": product,
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Product/${product.name.toString()}',
        options: Options(
          method: 'PUT',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Product Updated Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO update Product!");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }

  Future<Product?> getproduct(String id) async {
    baseurl= await geturl();
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Product/$id',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return Product.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } catch (e) {
      Logger().i(e);
      Fluttertoast.showToast(msg: "Error while fetching Product");
    }
    return null;
  }
}
