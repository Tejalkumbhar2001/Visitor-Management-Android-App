import 'package:flutter/cupertino.dart';
import 'package:geolocation/model/product_model.dart';
import 'package:geolocation/services/list_product_services.dart';
import 'package:stacked/stacked.dart';
import '../../../router.router.dart';

class ListProductModel extends BaseViewModel {
  List<Product> productlist = [];
  void initialise(BuildContext context) async {
    setBusy(true);
    productlist = await ListProductServices().fetchProduct();
    setBusy(false);
  }

  void onRowClick(BuildContext context, Product? productlist) {
    Navigator.pushNamed(context, Routes.addProductScreen,
        arguments:
            AddProductScreenArguments(productid: productlist?.name ?? ""));
    // Navigator.pushNamed(context, Routes.addTeamMember,
    //     arguments: AddMemberArguments(memberid: memberlist?.name ?? ""));
  }

  Future<void> refreshList() async {
    productlist = await ListProductServices().fetchProduct();
    notifyListeners();
  }
}
