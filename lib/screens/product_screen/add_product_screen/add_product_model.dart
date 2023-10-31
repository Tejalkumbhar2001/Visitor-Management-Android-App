import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../../../constants.dart';
import '../../../router.router.dart';
import '../../../services/add_product_services.dart';

class ProductModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController productcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  bool isEdit = false;
  Product productdata = Product();
  void initialise(BuildContext context, String productid) async {
    setBusy(true);
    if (productid != "") {
      isEdit = true;
      productdata = await ProductServices().getproduct(productid) ?? Product();
      productcontroller.text = productdata.productName ?? "";
      descriptioncontroller.text = productdata.description ?? "";
      notifyListeners();
    }
    setBusy(false);
  }

  void onSaved(BuildContext context) async {
    setBusy(true);

    if (formKey.currentState!.validate()) {
      productcontroller.text = productdata.productName ?? "";
      descriptioncontroller.text = productdata.description ?? "";
      notifyListeners();

      try {
        await uploadFiles();
        bool success = await ProductServices().addproduct(productdata);

        if (success && context.mounted) {
          setBusy(false);
          Navigator.popAndPushNamed(
            context,
            Routes.productList,
          );
        }
      } catch (error) {
        // Handle errors here, if needed
        print("Error: $error");
      }
    }

    setBusy(false);
  }

  void setproduct(String? product) {
    productdata.productName = product;
    notifyListeners();
  }

  void setdescription(String? description) {
    productdata.description = description;
    notifyListeners();
  }

  // Variable to hold the selected PDF file
  Files files = Files();
  bool isFileSelected(String fileType) {
    return files.getFile(fileType) != null;
  }

  File? getFileFromFileType(String filetype) {
    if (filetype == kAadharpdf) return files.adharCard;
    Logger().i(files.adharCard);
    return null;
  }

  String? getFileFromProduct(String filetype) {
    print(filetype);
    print("SELECTED FILE: ");
    if (filetype == kAadharpdf) return productdata.productImage;

    return null;
  }

  // Function to open file picker and select PDF file
  Future<void> selectPdf(String fileType, ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(source: source);
      if (result != null) {
        // print("SIZE BEFORE: ${result.files.single.size}");
        setBusy(true);
        File? compressedFile = await compressFile(fileFromXFile(result));
        // print("SIZE BEFORE: ${compressedFile?.lengthSync()}");
        files.setFile(fileType, compressedFile);
        setBusy(false);
        notifyListeners();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error while picking an image or document: $e');
    }
  }

  // Function to upload the selected PDF file (Aadhar card)
  Future<void> uploadFiles() async {
    String productrUrl = await ProductServices().uploadDocs(files.adharCard);
    if (productrUrl == "" && isEdit == false) {
      Fluttertoast.showToast(msg: "Failed to upload Product Image");
    }
    productdata.productImage =
        productrUrl == "" ? productdata.productImage : productrUrl;
  }

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    Logger().i('disposed controller');
    productcontroller.dispose();
    descriptioncontroller.dispose();
    super.dispose();
  }
}

class Files {
  File? adharCard;

  File? getFile(String fileType) {
    if (fileType == kAadharpdf) {
      return adharCard;
    }
    return null;
  }

  void setFile(String fileType, File? file) {
    if (fileType == kAadharpdf) {
      adharCard = file;
    }
  }
}
