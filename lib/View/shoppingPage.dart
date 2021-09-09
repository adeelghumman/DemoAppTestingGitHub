import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/cart_controller.dart';
import 'package:flutter_application_1/Controller/shopping_controller.dart';
import 'package:flutter_application_1/View/checkoutPage.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(ShoppingCartController());
  // const ShoppingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart),
            GetX<ShoppingCartController>(builder: (controller) {
              return Text("${controller.count.toString()}");
            }),
          ],
        ),
      ),
      backgroundColor: Colors.cyan.shade300,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.product.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //color: Colors.amber,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${controller.product[index].productName}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "${controller.product[index].productDescription}",
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "\$ " +
                                            "${controller.product[index].price}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    RaisedButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        cartController.addtocart(
                                            controller.product[index]);
                                      },
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Obx(() {
                                      return IconButton(
                                          icon: controller
                                                  .product[index].check.value
                                              ? Icon(Icons.check_box)
                                              : Icon(Icons
                                                  .check_box_outline_blank),
                                          onPressed: () {
                                            controller.product[index].check
                                                .toggle();
                                          });
                                    })
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<ShoppingCartController>(builder: (controller) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed("/homepage");
                },
                child: Text(
                  "Total Amout: \$ ${controller.totalprice.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
