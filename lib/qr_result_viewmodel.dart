import 'package:flutter/cupertino.dart';
import 'package:geolocation/services/qrcode_extraction_services.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import 'model/qrcode_extraction_model.dart';

class QrResultModel extends BaseViewModel{

  QrCodeExtraction qrcodeextraction = QrCodeExtraction();
  void initialise(BuildContext context, String url) async {
    setBusy(true);
    if (url != "") {
      qrcodeextraction = (await QrCodeExtractionServices().getqrcodeextraction(url)) ?? QrCodeExtraction();
      notifyListeners();
  Logger().i(qrcodeextraction.toJson());
    }
    setBusy(false);
  }
}