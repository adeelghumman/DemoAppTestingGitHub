import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/product_controller.dart';
import 'package:flutter_application_1/View/Product_tile.dart';
import 'package:flutter_application_1/View/settingPage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  final Product_controller productController = Get.put(Product_controller());

  Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.cyanAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Get.to(Settingpage());
                },
                child: Icon(
                  Icons.settings,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: layout(),
    );
  }

  layout() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ShopX",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.ac_unit_rounded), onPressed: () {}),
                  IconButton(icon: Icon(Icons.account_tree), onPressed: () {})
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Obx(() => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.allproducts.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.allproducts[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                )))
      ],
    );
  }
}
