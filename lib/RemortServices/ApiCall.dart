import 'package:flutter_application_1/Model/allProducts.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future<List<AllProducts>> fetchProducts() async {
    var response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    return allProductsFromJson(response.body);
  }

  // static var client = http.Client();

  // static Future<List<AllProducts>> fetchProducts() async {
  //   var response = await client.get(Uri.parse(
  //       'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     return allProductsFromJson(jsonString);
  //   } else {
  //     //show error message
  //     return null;
  //   }
  // }
}
