import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${controller.value}"),
    );
  }
}
