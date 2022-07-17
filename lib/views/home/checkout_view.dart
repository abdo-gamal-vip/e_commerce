import 'package:e_commerce/view_models/cart_view_model.dart';
import 'package:e_commerce/views/home/account_view.dart';
import 'package:e_commerce/views/home/checkout_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class checkout extends GetWidget<CartViewModel> {
  checkout({Key? key}) : super(key: key);
  final controller = Get.put(CartViewModel());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(controller: controller.pageController, children: [
        Checkform(),
        AccountView(),
      ]),
    ));
  }
}
