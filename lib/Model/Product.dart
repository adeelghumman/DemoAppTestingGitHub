import 'package:get/get.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  final check = false.obs;

  Product(this.id, this.productName, this.productImage, this.productDescription,
      this.price);
}
