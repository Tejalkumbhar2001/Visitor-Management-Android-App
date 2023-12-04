import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../constants.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerScreen extends StatelessWidget {
//   final String pdfUrl;
//
//   const PDFViewerScreen({super.key, required this.pdfUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: SfPdfViewer.network(
//         pdfUrl, // Provide the network URL of the PDF file
//
//       ),
//     );
//   }
// }
  final String pdfUrl;

  PDFViewerScreen({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: FutureBuilder(
        future: DefaultCacheManager().getSingleFile(pdfUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading PDF'));
          } else if (snapshot.hasData && snapshot.data is File) {
            return SfPdfViewer.file(
              File(snapshot.data!.path),
              canShowPaginationDialog: true,
            );
          } else {
            return Center(child: Text('Invalid PDF URL'));
          }
        },
      ),
    );
  }
}