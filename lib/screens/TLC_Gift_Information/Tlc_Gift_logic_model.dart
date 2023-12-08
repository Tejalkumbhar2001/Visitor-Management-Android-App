import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/model/visitor_attendence_model.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../../model/qrcode_extraction_model.dart';
import '../../../model/visitor_info_model.dart';
import '../../../services/qrcode_extraction_services.dart';
import '../../../services/visitor_attendence_services.dart';
import '../../model/tlc_gift_info_model.dart';
import '../../router.router.dart';
import '../../services/tlc_gift_services.dart';
import 'Tlc_Gift_result_view.dart';

class TlcGiftModel extends BaseViewModel {
  bool isTLCMember = false;
  bool isEdit = false;
  bool res = false;
  //bool res = true;
  QrCodeExtraction qrcodeextraction = QrCodeExtraction();
  TLCGiftAllocationModel tlcgiftallocationmodel=TLCGiftAllocationModel();

  TlcGiftResultScreen view=TlcGiftResultScreen(closeScreen: () {  }, code: '',);
  initialise(BuildContext context, String visitorid) async {
    setBusy(true);
    if (visitorid != "") {
      isEdit = true;
      qrcodeextraction = (await QrCodeExtractionServices().getqrcodeextraction(visitorid)) ?? QrCodeExtraction();
      visitor_information();
      if(qrcodeextraction.customTlcMember == 'Yes'){
        isTLCMember = true;
      }
      tlcgiftallocationmodel.name=qrcodeextraction.name;
      tlcgiftallocationmodel.name1=qrcodeextraction.userName;
      tlcgiftallocationmodel.email=qrcodeextraction.email;
      tlcgiftallocationmodel.whatsappMobileNumber=qrcodeextraction.wtspNumber;
      tlcgiftallocationmodel.tlcMember=qrcodeextraction.customTlcMember;
      tlcgiftallocationmodel.tlcLevel=qrcodeextraction.customTlcLevel;
      notifyListeners();
    }
    setBusy(false);
  }

  void onSaved(BuildContext context) async {
    setBusy(true);
    res = await TlcGiftServices().addtlcgiftinfo(context,tlcgiftallocationmodel);
    res ? view.showSaveDialog(context) : view.showFailureDialog(context);
    if (res) {
      if (context.mounted) {
        setBusy(false);
        setBusy(false);
        //Navigator.pop(context,Routes.homePage);
        //Navigator.popAndPushNamed(context,Routes.homePage);
      }
    }
    setBusy(false);
  }

}
