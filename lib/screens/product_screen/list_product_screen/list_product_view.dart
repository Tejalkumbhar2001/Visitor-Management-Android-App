import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/constants.dart';
import 'package:stacked/stacked.dart';
import '../../../router.router.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
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
              ),
              body: fullScreenLoader(
                  loader: model.isBusy,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        model.productlist.isNotEmpty
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
                                    itemCount: model.productlist.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => model.onRowClick(
                                            context, model.productlist[index]),
                                        child: Card(
                                          elevation: 2,
                                          margin: EdgeInsets.all(8),
                                          child: Stack(
                                            children: <Widget>[
                                              // Product Image
                                              ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                child: Image.network(
                                                  '$baseurl${model.productlist[index].productImage}',
                                                  fit: BoxFit.fill,
                                                  height: 100,
                                                  width: double.infinity,
                                                ),
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
                                                    (model.productlist[index]
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
                                          "You haven't created a Team Member yet")),
                                  CtextButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, Routes.addProductScreen,
                                          arguments: AddProductScreenArguments(
                                              productid: ""));
                                    },
                                    text: 'Create Team Member',
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                  context: context),
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
