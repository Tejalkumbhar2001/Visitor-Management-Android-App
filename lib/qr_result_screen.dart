import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/qr_code_scanner.dart';
import 'package:geolocation/qr_code_scanner.dart';
import 'package:geolocation/qr_code_scanner.dart';
import 'package:geolocation/qr_code_scanner.dart';
import 'package:geolocation/qr_result_viewmodel.dart';
import 'package:geolocation/router.router.dart';
import 'package:geolocation/screens/visitor_information/add_visitor/add_visitor_model.dart';
import 'package:geolocation/screens/visitor_information/add_visitor/add_visitor_view.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';

class ResultScreen extends StatelessWidget {
  final String code                                                                                                                                                                                                                 ;
  final Function() closeScreen;
  const ResultScreen({super.key,required this.closeScreen,required this.code});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QrResultModel>.reactive(
        viewModelBuilder: () => QrResultModel(),
    onViewModelReady: (model) => model.initialise(context,code),
    builder: (context, model, child) => Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Result Screen",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context, Routes.homePage);}, icon: const Icon(Icons.arrow_back)),
// leading: IconButton(onPressed: (){
//   Navigator.push(context, MaterialPageRoute(builder: (context)=> const QRCodeScanner()));
// }, icon: Icon(Icons.arrow_back)),
      ),

      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                 data: code,
                version: QrVersions.auto,
                size: 200.0,
              ),

              const Text(
                "Scanned result",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$code",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: (){
                  // Clipboard.setData(ClipboardData(text: code));
                  // Navigator.pushNamed(context, Routes.addVisitor);
                  // Navigator.pushNamed(
                  //     context, Routes.addVisitor,
                  //     arguments: const AddVisitorArguments(
                  //         visitorid: ""));
                  //Fluttertoast.showToast(msg: 'text is copied');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddVisitor(
                        visitorid: "",  // Provide the actual visitorId if needed
                        dataMap: {
                          "address": model.qrcodeextraction.address ?? "",
                          "userName": model.qrcodeextraction.userName ?? "",
                          "wtspNumber": model.qrcodeextraction.wtspNumber ?? "",
                          "email": model.qrcodeextraction.email ?? "",
                          "customCompanyName": model.qrcodeextraction.customCompanyName ?? "",
                          "customAge": model.qrcodeextraction.customAge ?? "",
                          //"eventName": model.qrcodeextraction.eventName ?? "",
                        },
                      ),
                    ),
                  );
                }, child: const Text
                (
                "Add Visitor Information ",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              ),
              Text(
                model.qrcodeextraction.name ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              Text(
                model.qrcodeextraction.eventName ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),Text(
                model.qrcodeextraction.email ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              Text(
                model.qrcodeextraction.wtspNumber ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              Text(
                model.qrcodeextraction.userName ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              Text(
                model.qrcodeextraction.address ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),

              Text(
                model.qrcodeextraction.customCompanyName ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),

              Text(
                model.qrcodeextraction.customAge ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),


            ],
          ),
        ),
      ),
    ));
  }
}
