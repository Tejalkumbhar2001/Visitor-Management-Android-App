import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/constants.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../../../router.router.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/textfielddecoration.dart';
import 'list_product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListProductModel>.reactive(
        viewModelBuilder: () => ListProductModel(),
        onViewModelReady: (model) => model.initialise(context),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Product List"),
                leading: IconButton(onPressed: (){Navigator.popAndPushNamed(context, Routes.homePage);}, icon: Icon(Icons.arrow_back)),
              ),
              body: WillPopScope(
                onWillPop: ()  async{
                  Navigator.popAndPushNamed(context,Routes.homePage);
                  return true; },
                child: fullScreenLoader(
                    loader: model.isBusy,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: TextField(
                                onChanged: (value) {
                                  model.namecontroller.text = value;
                                  model.filterListByName(
                                      name: value);
                                },
                                decoration: AppInputDecorations.textFieldDecoration(labelText: "Search Name", hintText: "Name", prefixIcon: Icons.search)
                            ),
                          ),
                          model.productfilterleadlist.isNotEmpty
                              ? Expanded(
                                  child: RefreshIndicator(
                                    onRefresh: model.refreshList,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            2, // Number of columns in the grid
                                        childAspectRatio:
                                            0.8, // Width to height ratio of grid items
                                      ),
                                      itemCount: model.productfilterleadlist.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () => model.onRowClick(
                                              context, model.productfilterleadlist[index]),
                                          child: Card(
                                            elevation: 2,
                                            margin: EdgeInsets.all(8),
                                            child: Stack(
                                              fit: StackFit.loose,
                                              children: <Widget>[
                                                // Product Image
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(10)),
                                                  child:
                                                  Image.network(
                                                    '$baseurl${model.productfilterleadlist[index].productImage}',
                                                    fit: BoxFit.fill,
                                                    width: double.infinity,
                                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                      if (loadingProgress == null) {
                                                        // Image is done loading
                                                        Logger().i(baseurl+ (model.productfilterleadlist[index].productImage ?? ""));
                                                        return child;
                                                      } else {
                                                        // Image is still loading
                                                        return const Center(child: CircularProgressIndicator(color: Colors.blueAccent,));
                                                      }
                                                    },
                                                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                      // Handle the error by displaying a broken image ico
                                                      Logger().i(baseurl+ (model.productfilterleadlist[index].productImage ?? ""));
                                                      return const Center(child: Icon(Icons.broken_image, size: 80.0));
                                                    },
                                                  )


                                                ),
                                                // Text Overlay
                                                Positioned(
                                                  bottom: 0,
                                                  left: 0,
                                                  right: 0,
                                                  child: Container(
                                                    color: Colors.black.withOpacity(
                                                        0.6), // Adjust overlay color and opacity here
                                                    padding: EdgeInsets.all(8),
                                                    child: AutoSizeText(
                                                      (model.productfilterleadlist[index]
                                                              .productName ??
                                                          ""),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Center(
                                        child: Text(
                                            "You haven't created Product yet")),
                                    CtextButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, Routes.addProductScreen,
                                            arguments: AddProductScreenArguments(
                                                productid: ""));
                                      },
                                      text: 'Create Product',
                                    )
                                  ],
                                )
                        ],
                      ),
                    ),
                    context: context),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.background,
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.addProductScreen,
                      arguments: AddProductScreenArguments(productid: ""));
                },
                child: const Icon(Icons.person_add_alt_1),
              ),
            ));
  }
}
