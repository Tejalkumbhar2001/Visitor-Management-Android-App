import 'package:flutter/cupertino.dart';
import 'package:geolocation/model/product_model.dart';
import 'package:geolocation/services/list_product_services.dart';
import 'package:stacked/stacked.dart';
import '../../../router.router.dart';
import '../../../services/add_product_services.dart';

class ListProductModel extends BaseViewModel {
  List<Product> productlist = [];
  List<Product> productfilterleadlist = [];
  TextEditingController namecontroller=TextEditingController();
  String Filter = "";
  void initialise(BuildContext context) async {
    setBusy(true);
    productlist = await ListProductServices().fetchProduct();
    productfilterleadlist=productlist;
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
  void filterListByName({String? name}) async {
    Filter = name ?? Filter;
    notifyListeners();
    productfilterleadlist =
    await ListProductServices().getListByNameFilter(Filter);
    notifyListeners();

  }

}
