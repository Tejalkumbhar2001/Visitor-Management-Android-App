import 'package:flutter/cupertino.dart';
import 'package:geolocation/services/visitor_info_services.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../../model/visitor_info_model.dart';
import '../../../router.router.dart';

class AddVisitorModel extends BaseViewModel {
  visitor_information visitordata = visitor_information();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController villagecontroller = TextEditingController();
  TextEditingController talukacontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController whatsappcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController comanynamecontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController feedbackcontroller = TextEditingController();

  List<Product> products = [];
  final formKey = GlobalKey<FormState>();
  List<Product> productList = [];
  Product product = Product();

  bool isEdit = false;

  initialise(BuildContext context, String visitorid) async {
    setBusy(true);
    productList = await visitorinfoservices().fetchProduct();
    if (visitorid != "") {
      isEdit = true;
      visitordata = await visitorinfoservices().getvisitor(visitorid) ??
          visitor_information();
      agecontroller.text = visitordata.age.toString();
      firstnamecontroller.text = visitordata.firstName ?? "";
      villagecontroller.text = visitordata.village ?? "";
      talukacontroller.text = visitordata.taluka ?? "";
      pincodecontroller.text = visitordata.pincode ?? "";
      whatsappcontroller.text = visitordata.whatsappNo ?? "";
      emailcontroller.text = visitordata.email ?? "";
      comanynamecontroller.text = visitordata.company ?? "";
      designationcontroller.text = visitordata.designation ?? "";
      feedbackcontroller.text = visitordata.feedback ?? "";
      statecontroller.text = visitordata.state ?? "";
      notifyListeners();
      products.addAll(visitordata.product?.toList() ?? []);
    }
    setBusy(false);
  }

  void onSaved(BuildContext context) async {
    setBusy(true);
    if (formKey.currentState!.validate()) {
      visitordata.product = products;
      visitordata.firstName = firstnamecontroller.text;
      visitordata.village = villagecontroller.text;
      visitordata.taluka = talukacontroller.text;
      visitordata.pincode = pincodecontroller.text;
      visitordata.whatsappNo = whatsappcontroller.text;
      visitordata.email = emailcontroller.text;
      visitordata.company = comanynamecontroller.text;
      visitordata.designation = designationcontroller.text;
      visitordata.feedback = feedbackcontroller.text;
      visitordata.state = statecontroller.text;
      Logger().i(visitordata.toJson().toString());
      bool res = false;
      if (isEdit == true) {
        res = await visitorinfoservices().Updatevisitor(visitordata);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.popAndPushNamed(context, Routes.visitorList);
          }
        }
      } else {
        res = await visitorinfoservices().addvisitor(visitordata);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.popAndPushNamed(context, Routes.visitorList);
          }
        }
      }
    }
    setBusy(false);
  }

  String firstname = "";
  void setSelectedName(String? plant) {
    visitordata.firstName = plant;
    notifyListeners();
  }

  void setage(String? age) {
    agecontroller.value = agecontroller.value.copyWith(
      text: age ?? '',
      selection: TextSelection.collapsed(offset: (age ?? '').length),
    );
    visitordata.age = int.tryParse(age ?? "") ?? 0;
    notifyListeners();
  }

  void addProduct(Product product) {
    // Check if the product is already in the list based on productName
    bool isProductAlreadyAdded = products.any((existingProduct) =>
        existingProduct.productName == product.productName);

    if (!isProductAlreadyAdded) {
      // If the product is not already in the list, add it
      products.add(Product(
        name: product.name,
        productName: product.productName,
        description: product.description,
      ));
      notifyListeners();
      visitordata.product = products;
      Logger().i(products
          .toList()
          .toString()); // Notify listeners to update the UI when the list changes
    }
  }

  void deleteVisitor(int index) {
    if (index >= 0 && index < products.length) {
      products.removeAt(index);
      notifyListeners();
    }
  }

  void setaddressline(String? address) {
    visitordata.village = address;
    notifyListeners();
  }

  void setpinocde(String? pincode) {
    visitordata.pincode = pincode;
    notifyListeners();
  }

  void setaddressline2(String? address1) {
    visitordata.taluka = address1;
    notifyListeners();
  }

  void setemail(String? email) {
    visitordata.email = email;
    notifyListeners();
  }

  void setstate(String? state) {
    visitordata.state = state;
    notifyListeners();
  }

  void setwhatsapp(String? number) {
    visitordata.whatsappNo = number;
    notifyListeners();
  }

  void setcomapany(String? comapany) {
    visitordata.company = comapany;
    notifyListeners();
  }

  void setdesignation(String? desgination) {
    visitordata.designation = desgination;
    notifyListeners();
  }

  void setfeedback(String? feedback) {
    visitordata.feedback = feedback;
    notifyListeners();
  }

  String formatMobileNumber(String value) {
    value = value.replaceAll(' ', ''); // Remove existing spaces
    if (value.length > 3) {
      value = '${value.substring(0, 3)} ${value.substring(3, value.length)}';
    }
    if (value.length > 7) {
      value = '${value.substring(0, 7)} ${value.substring(7, value.length)}';
    }
    return value;
  }

  void onMobileNumberChanged(String value) {
    String formattedMobileNumber = formatMobileNumber(value);
    visitordata.whatsappNo = formattedMobileNumber.replaceAll(" ", '');
  }

  ///validators ////
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Name';
    }
    return null;
  }

  String? validateComapny(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Comapany';
    }
    return null;
  }

  String? validatedesignation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Designation';
    }
    return null;
  }

  String? validateemail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Email';
    }
    if (!value.contains('@')) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    }
    if (value.replaceAll(" ", "").length != 10) {
      return 'Mobile number should be exactly 10 digits';
    }
    // Additional validation rules can be added if needed.
    return null;
  }

  String? validatewhatsappNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter WhatsappNo';
    }
    return null;
  }

  String? validateaddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Address';
    }
    return null;
  }

  String? validatepincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Pincode';
    }
    if (value.length < 6) {
      return 'Please Valid Pincode';
    }

    return null;
  }

  String? validateage(String? age) {
    if (age == null || age == 0) {
      return 'Please enter age';
    }
    return null;
  }

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    Logger().i('disposed controller');
    firstnamecontroller.dispose();
    agecontroller.dispose();
    villagecontroller.dispose();
    talukacontroller.dispose();
    pincodecontroller.dispose();
    statecontroller.dispose();
    whatsappcontroller.dispose();
    emailcontroller.dispose();
    comanynamecontroller.dispose();
    designationcontroller.dispose();
    feedbackcontroller.dispose();
    super.dispose();
  }
}
