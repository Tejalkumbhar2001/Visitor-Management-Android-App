import 'package:flutter/cupertino.dart';
import 'package:geolocation/model/visitor_attendence_model.dart';
import 'package:stacked/stacked.dart';
import '../../../model/qrcode_extraction_model.dart';
import '../../../model/visitor_info_model.dart';
import '../../../router.router.dart';
import '../../../services/qrcode_extraction_services.dart';
import '../../../services/visitor_attendence_services.dart';

class AddAttendenceModel extends BaseViewModel {
bool isdialog = false;
  bool isEdit = false;
bool res = false;
  QrCodeExtraction qrcodeextraction = QrCodeExtraction();
  VisitorAttendence visitorattendencedata=VisitorAttendence();
  initialise(BuildContext context, String visitorid) async {
    setBusy(true);
    if (visitorid != "") {
      isEdit = true;
      qrcodeextraction = (await QrCodeExtractionServices().getqrcodeextraction(visitorid)) ?? QrCodeExtraction();
          visitor_information();
          visitorattendencedata.name=qrcodeextraction.name;
      visitorattendencedata.email=qrcodeextraction.email;
      visitorattendencedata.wtspNumber=qrcodeextraction.wtspNumber;
      visitorattendencedata.companyName=qrcodeextraction.customCompanyName;
      visitorattendencedata.userName=qrcodeextraction.userName;
visitorattendencedata.companyName=qrcodeextraction.customCompanyName;
      notifyListeners();
    }
    setBusy(false);
  }

  void onSaved(BuildContext context) async {
    setBusy(true);

        res = await VisitorAttendanceServices().addvisitorattendence(visitorattendencedata);
        if (res) {
          isdialog=true;
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            //Navigator.popAndPushNamed(context,Routes.homePage);

          }
        }

    setBusy(false);
  }

}
