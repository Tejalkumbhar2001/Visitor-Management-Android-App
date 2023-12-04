import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:file_picker/file_picker.dart';
import '../../../constants.dart';
import '../../../router.router.dart';
import '../../../services/add_product_services.dart';

class ProductModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController productcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  bool res = false;
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
      await uploadFiles();
      notifyListeners();
      if (isEdit == true) {
        res = await ProductServices().updateproduct(productdata);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.popAndPushNamed(
              context,
              Routes.productList,
            );
          }
        }
      } else {
        res = await ProductServices().addproduct(productdata);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.popAndPushNamed(
              context,
              Routes.productList,
            );
          }
        }
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
    print(productdata.productImage);
    if (filetype == kAadharpdf) return productdata.productImage;
    return null;
  }

  // //Function to open file picker and select PDF file
  Future<void> selectimage(String fileType, ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(source: source);
      // final result =  await FilePicker.platform.pickFiles(
      //   type:FileType.custom,
      //   allowedExtensions: ['jpg','pdf','doc'],
      // );

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



  Future<void> selectPdf(String fileType) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setBusy(true);
        File? selectedFile = File(result.files.single.path!);
     //   String uploadedFileUrl = await ProductServices().uploadDocs(selectedFile);
        files.setFile(fileType, selectedFile);
       // productdata.productImage = uploadedFileUrl;

        setBusy(false);
        notifyListeners();
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error while picking a PDF file: $e',
      );
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
  FilePicker? pdfCard;

  File? getFile(String fileType) {
    if (fileType == kAadharpdf) {
      return adharCard;
    }
    return null;
  }

  File? getpdfFile(String fileType) {
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

  void setPdfFile(String fileType, FilePicker? file) {
    if (fileType == kAadharpdf) {
      pdfCard = file;
    }
  }
}
