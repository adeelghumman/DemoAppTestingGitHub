import 'package:flutter_application_1/Model/Product.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  var cartitems = List<Product>().obs;
  int get count => cartitems.length;
  double get totalprice =>
      cartitems.fold(0, (sum, cartitems) => sum + cartitems.price);

  addtocart(Product product) {
    cartitems.add(product);
  }
}
