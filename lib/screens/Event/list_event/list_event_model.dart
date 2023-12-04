
import 'package:flutter/cupertino.dart';
import 'package:geolocation/model/eventlist_model.dart';
import 'package:stacked/stacked.dart';

import '../../../router.router.dart';

import '../../../services/list_event_services.dart';
import '../add_event/add_event_view.dart';
import '../add_event/add_event_view.dart';
import '../add_event/add_event_view.dart';

class ListEventModel extends BaseViewModel {
  List<EventList> eventlist = [];
  List<EventList> eventfilterleadlist = [];
  TextEditingController namecontroller=TextEditingController();
  String Filter = "";


  void initialise(BuildContext context) async {

    setBusy(true);
    eventlist = await ListEventServices().fetchEvent();
    eventfilterleadlist=eventlist;

    setBusy(false);
  }

  void onRowClick(BuildContext context, EventList? eventlist) {
    // Navigator.pushNamed(context, Routes.addEventScreen);

    Navigator.pushNamed(context, Routes.addEventScreen,
         arguments: AddEventScreenArguments(eventid: eventlist?.name ?? ""));
  }

  Future<void> refreshList() async {
    eventlist = await ListEventServices().fetchEvent();
    notifyListeners();
  }
  void filterListByName({String? name}) async {
    Filter = name ?? Filter;
    notifyListeners();
    eventfilterleadlist =
    await ListEventServices().getListByNameFilter(Filter);
    notifyListeners();

  }

}
