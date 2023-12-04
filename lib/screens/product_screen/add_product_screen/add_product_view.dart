import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../constants.dart';
import '../../../router.router.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/textfielddecoration.dart';
import '../../../widgets/view_docs_from_internet.dart';
import 'package:path/path.dart' as p;
import '../../../widgets/view_image.dart';
import '../../../widgets/view_pdf.dart';
import 'add_product_model.dart';

class AddProductScreen extends StatefulWidget {
  final String productid;
  const AddProductScreen({super.key, required this.productid});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductModel>.reactive(
      viewModelBuilder: () => ProductModel(),
      onViewModelReady: (model) => model.initialise(context, widget.productid),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        body: WillPopScope(
          onWillPop: ()  async{
            Navigator.popAndPushNamed(context, Routes.productList);

            return true; },
          child: fullScreenLoader(
            child: SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: model.productcontroller,
                        decoration: AppInputDecorations.textFieldDecoration(
                            labelText: 'Product',
                            hintText: 'Mobile',
                            prefixIcon: Icons.person),
                        onChanged: model.setproduct,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a Product Name' : null,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: model.descriptioncontroller,
                        decoration: AppInputDecorations.textFieldDecoration(
                            labelText: 'Description',
                            hintText: 'Motorola Mobile',
                            prefixIcon: Icons.person),
                        onChanged: model.setdescription,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a Description' : null,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        // onPressed: () => model.selectPdf(kAadharpdf),
                        onPressed: () => pickDoc(kAadharpdf, context, model),
                        child: model.productdata.productImage != null
                            ? Text(
                                'Product File: ${model.productdata.productImage?.split("/").last}',
                                overflow: TextOverflow.ellipsis,
                              )
                            : model.isFileSelected(kAadharpdf)
                                ? Text(
                                    'Product File: ${model.files.getFile(kAadharpdf)?.path.split("/").last}',
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const Text('Attach Product'),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CtextButton(
                            onPressed: () => model.onSaved(context),
                            text: 'Save',
                          ),
                          CtextButton(
                            text: 'Cancel',
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            context: context,
            loader: model.isBusy,
          ),
        ),
      ),
    );
  }

  void pickDoc(String filetype, BuildContext context, ProductModel model) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick an image or document'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () {
                Navigator.of(context).pop();
                model.selectimage(filetype,ImageSource.camera);   //,ImageSource.camera
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_copy),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                model.selectPdf(filetype);    //,ImageSource.gallery
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.file_copy_sharp),
            //   title: const Text('PDF'),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     model.Pdfpicker(filetype);
            //   },
            // ),

            if (model.files.getFile(filetype) != null ||
                (model.getFileFromProduct(filetype) ?? "").isNotEmpty)
              ElevatedButton(
                onPressed: () {
                 String fileextension = (model.getFileFromProduct(filetype)?.substring(model.getFileFromProduct(filetype)!.length - 3)).toString();
                 Logger().i(fileextension);
                  Navigator.of(context).pop();
                  if (model.files.getFile(filetype) != null) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (BuildContext context) => ViewImage(
                  image: Image.file( model.getFileFromFileType(filetype) ?? File("")),
                  ),
                  ),
                  );
                  } else {
                    if(fileextension == 'pdf'){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PDFViewerScreen(
                              pdfUrl:baseurl + (model.getFileFromProduct(filetype) ?? ""),
                            ),)  );
                    }
                    else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (BuildContext context) => ViewImageInternet(
                        url: model.getFileFromProduct(filetype) ?? "",
                      ),)  );
                    }}
                },
                child: const Text("View Uploaded File"),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
