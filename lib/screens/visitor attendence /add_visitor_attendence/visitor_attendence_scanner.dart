import 'package:flutter/material.dart';
import 'package:geolocation/router.router.dart';
import 'package:geolocation/screens/visitor%20attendence%20/add_visitor_attendence/visitor_attendence_result_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';


//const bgColor = Color(0xfffafafa);
const bgColor = Color(0xFFFAFAFA);

class AttendenceScanner extends StatefulWidget {
  const AttendenceScanner({super.key});

  @override
  State<AttendenceScanner> createState() => _AttendenceScannerState();
}

class _AttendenceScannerState extends State<AttendenceScanner> {
  bool isScanCompleted = false;

  bool isFlashON = false;
  MobileScannerController controller = MobileScannerController(detectionSpeed: DetectionSpeed.normal,detectionTimeoutMs: 250);
  bool isFrontCamera = false;
  List<Barcode> barcodes=[];
  void closeScreen(){
    setState(() {
      barcodes.clear();
    });
    isScanCompleted=false;

  }
  // @override
  // void initState() {
  //   barcodes.clear();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState((){
              isFlashON=!isFlashON;
            }
            );
            controller.toggleTorch();
          }, icon:  Icon(Icons.flash_on, color:isFlashON ?Colors.blueAccent :Colors.grey)),
          IconButton(onPressed: (){

            setState((){
              isFrontCamera=!isFrontCamera;
            }
            );
            controller.switchCamera();
          }, icon:  Icon(Icons.camera_front, color:isFrontCamera ?Colors.blueAccent :Colors.grey)),
        ],
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context, Routes.visitorList);}, icon: Icon(Icons.arrow_back)),
        // leading: IconButton(onPressed: (){
        //   Navigator.pop(context, MaterialPageRoute(builder: (context)=> VisitorList()));
        // }, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Place the QR code in the area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Scanning will be started automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),

            ),
            Expanded(
                flex: 5,
                child: Stack(
                  children: [

                    MobileScanner(
                        onDetect: (capture) {
                          barcodes = capture.barcodes;
                          if(!isScanCompleted){
                            for (final barcode in barcodes) {
                              if (barcode.rawValue?.isNotEmpty == true) {
                                isScanCompleted = true;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AttendenceResultScreen(
                                      closeScreen: closeScreen,
                                      code: barcode.rawValue.toString(),
                                    ),
                                  ),
                                );
                              }
                            }
                          }},
                        controller: controller
                    ),

                    //const QRScannerOverlay(overLayColor: bgColor )
                    QRScannerOverlay(overlayColor:bgColor),
                  ],
                )

            ),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Developed by Quantbit",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),

                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
