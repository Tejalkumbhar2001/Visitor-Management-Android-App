import 'package:flutter/cupertino.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:stacked/stacked.dart';
import '../../../model/visitor_list_model.dart';
import '../../../router.router.dart';
import '../../../services/visitor_list.dart';

class listvisitormodel extends BaseViewModel {
  List<visitor_list> leadlist = [];
  List<visitor_list> filterleadlist = [];
  // List<visitor_list> sessionfilteredlist =[];
 TextEditingController namecontroller=TextEditingController();

  String Filter = "";
  visitor_information visitordata = visitor_information();
  initialise(BuildContext context) async {
    setBusy(true);
    leadlist = await Visitorlistservices().fetchLead();
    filterleadlist=leadlist;

    setBusy(false);
  }

  Future<void> refreshleadlist() async {
    leadlist = await Visitorlistservices().fetchLead();
    notifyListeners();
  }

  void filterListByName({String? name}) async {
    Filter = name ?? Filter;
    notifyListeners();
    filterleadlist =
        await Visitorlistservices().getListByNameFilter(Filter);
    notifyListeners();

  }


  void onRowClick(BuildContext context, visitor_list? visitorList) {
    Navigator.pushNamed(context, Routes.addVisitor,
        arguments: AddVisitorArguments(visitorid: visitorList?.name ?? "", dataMap: {}));
  }
}
