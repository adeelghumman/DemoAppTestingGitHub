import 'package:flutter_application_1/Model/allProducts.dart';
import 'package:flutter_application_1/RemortServices/ApiCall.dart';
import 'package:get/get.dart';

class Product_controller extends GetxController {
  var allproducts = List<AllProducts>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchingProduct();
  }

  void fetchingProduct() async {
    var products = await RemoteServices.fetchProducts();

    if (products != null) {
      allproducts.value = products;
    }
  }
}
