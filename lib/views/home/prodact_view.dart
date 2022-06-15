import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  ProductView(
      {Key? key,
      required this.name,
      required this.color,
      required this.img,
      required this.details,
      required this.price})
      : super(key: key);
  String name;
  num price;
  String img;
  String color;
  String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 196 / Get.height,
                width: Get.width * 375 / Get.width,
                child: Stack(children: []),
              )
            ],
          )),
    );
  }
}
