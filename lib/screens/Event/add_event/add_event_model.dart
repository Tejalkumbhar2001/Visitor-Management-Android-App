
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../../model/event_model.dart';
import '../../../router.router.dart';
import '../../../services/add_event_services.dart';


class EventModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  List<String> statuslist= ["Open","Completed","Closed"];
  TextEditingController eventNamecontroller = TextEditingController();
  TextEditingController startsOncontroller = TextEditingController();
  TextEditingController endsOncontroller = TextEditingController();
  TextEditingController statuscontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  bool res = false;
  bool isEdit = false;
  Event eventdata = Event();
  void initialise(BuildContext context, String eventid) async {
    setBusy(true);
    if (eventid != "") {
      isEdit = true;
      eventdata = await AddEventServices().geteventName(eventid) ?? Event();
      eventNamecontroller.text = eventdata.eventName ?? "";
      startsOncontroller.text = eventdata.startsOn ?? "";
      endsOncontroller.text = eventdata.endsOn ?? "";
      statuscontroller.text = eventdata.status ?? "";
      locationcontroller.text = eventdata.location ?? "";
      notifyListeners();
    }
    setBusy(false);
  }

  void onsaved(BuildContext context) async {
    setBusy(true);
    if (formKey.currentState!.validate()) {
      bool res = false;
      eventdata.eventName = eventNamecontroller.text;
      eventdata.startsOn = startsOncontroller.text;
      eventdata.endsOn = endsOncontroller.text;
      eventdata.location = locationcontroller.text;
      Logger().i(eventdata.toJson().toString());
      if (isEdit == true) {
        res = await AddEventServices().updateEvent(eventdata);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.popAndPushNamed(
              context,
              Routes.listEventView,
            );
          }
        }
      } else {
      res = await AddEventServices().addEvent(eventdata);
      if (res) {
        if (context.mounted) {
          setBusy(false);
          setBusy(false);
          Navigator.popAndPushNamed(
            context,
            Routes.listEventView,
          );
        }
      }
     }
    }
    setBusy(false);
  }

  void seteventName(String? eventName) {
    eventdata.eventName = eventName;
    notifyListeners();
  }

  DateTime? startDate;
  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: startDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null && picked != startDate) {
  //     startDate = picked;
  //     startsOncontroller.text = picked.toString();
  //     eventdata.startsOn = startsOncontroller.text;
  //   }
  // }

  void setstartsOn(String? startsOn) {

    startsOncontroller.text = startsOn ?? "";
    eventdata.startsOn=startsOncontroller.text;
    notifyListeners();
  }


  DateTime? endDate;
  // Future<void> selectendDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: endDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null && picked != startDate) {
  //     startDate = picked;
  //     startsOncontroller.text = picked.toString();
  //     eventdata.startsOn = startsOncontroller.text;
  //   }
  // }

  void setendsOn(String? endsOn) {
    endsOncontroller.text = endsOn ?? "";
    eventdata.endsOn = endsOncontroller.text;
    notifyListeners();
  }

  void setstatus(String? status) {
    eventdata.status = status;
    notifyListeners();
  }


  // String? validaterole(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter role';
  //   }
  //   return null;
  // }

  // String? validatedesignation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter designation';
  //   }
  //   return null;
  // }

  // String? validateconfirmpassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter password';
  //   } else if (addmemberdata.password != addmemberdata.confirmPassword) {
  //     return "Password Dosen't Match";
  //   }
  //   return null;
  // }
  void setlocation(String? location) {
    eventdata.location = location;
    notifyListeners();
  }
  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    Logger().i('disposed controller');
    eventNamecontroller.dispose();
    startsOncontroller.dispose();
    endsOncontroller.dispose();
    statuscontroller.dispose();
    locationcontroller.dispose();
    super.dispose();
  }
}
