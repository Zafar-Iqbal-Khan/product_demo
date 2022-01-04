import 'package:flutter/material.dart';
import 'package:product_demo/controller/controller.dart';
import 'package:product_demo/services/api.dart';
import 'package:product_demo/views/MyHomePage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
