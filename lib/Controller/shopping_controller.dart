import 'package:flutter_application_1/Model/Product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var product = List<Product>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));
    var serverresponse = [
      Product(1, "First Product", 'abd', 'description', 34.6),
      Product(4, "second Product", 'absd', '2 description', 20.6),
      Product(5, "Third Product", 'absadd', '4 description', 34.6),
      Product(7, "Fourth Product", 'absadd', '67 description', 67.6),
    ];
    product.value = serverresponse;
  }
}
