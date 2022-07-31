import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/view_models/cart_view_model.dart';
import 'package:e_commerce/views/home/checkout_form.dart';
import 'package:e_commerce/widgets/small_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SummaryView extends GetWidget<CartViewModel> {
  SummaryView({Key? key}) : super(key: key);
  final controller = Get.put(CartViewModel());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Summary",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 812 * 180 / Get.height,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.cartList.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 812 * 120 / Get.height,
                            width: 812 * 120 / Get.height,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.cartList[index].img),
                                  fit: BoxFit.contain),
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(controller.cartList[index].name),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '\$${controller.cartList[index].price}',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                        ],
                      );
                    })),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Text(
                      "Shipping Address",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 812 * 120 / Get.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Column(
                      children: [
                        Text(
                          '${controller.Street1}, ${controller.Street2}, ${controller.City}, ${controller.State}, ${controller.Zip}',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Colors.black87),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(Checkform());
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(
                                    color: primaryColor, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        defSmallButton(
                            txt: "Back",
                            ontap: () {
                              controller.pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }),
                        defSmallButton(
                            txt: "order",
                            ontap: () {
                              controller.sendorder();
                            }),
                      ]),
                ],
              )
            ],
          )),
    ));
  }
}
