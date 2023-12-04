import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import '../../model/eventlist_model.dart';
import '../../services/list_event_services.dart';

 class AddSessionModel extends BaseViewModel {
   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
final formKey = GlobalKey<FormState>();
List<EventList> eventlist = [];
EventList? selectedEvent; // Property to store the selected event
String? event;
initialise(BuildContext context) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  setBusy(true);
  eventlist = await ListEventServices().fetchEvent();
  event= prefs.getString("event")?.toString();
  setBusy(false);
}

void setsession(EventList? session) {
  event=session?.name;
  selectedEvent = session; // Capture the selected event
  notifyListeners();
}

void onSavedSession(BuildContext context) async {
  final SharedPreferences prefs = await _prefs;
  setBusy(true);
  if (formKey.currentState!.validate()) {
    prefs.setString("event",event ?? "" );
    Logger().i(event);
    if (context.mounted) {
      setBusy(false);
      setBusy(false);
      Navigator.pop(context);

      Fluttertoast.showToast(
        msg: "Session added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

    }

  }
  setBusy(false);
}

}



