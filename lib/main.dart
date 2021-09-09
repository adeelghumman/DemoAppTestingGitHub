import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/SignupPage.dart';
import 'package:flutter_application_1/View/checkoutPage.dart';
import 'package:flutter_application_1/View/homePage.dart';
import 'package:flutter_application_1/View/shoppingPage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [GetPage(name: "/homepage", page: () => Homepage())],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: SignupPage(),
    );
  }
}
