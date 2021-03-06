import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/models/cart_product.dart';
import 'package:e_commerce/views/home/prodact_view.dart';
import 'package:e_commerce/view_models/cart_view_model.dart';
import 'package:e_commerce/views/home/img_view.dart';
import 'package:e_commerce/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:convert';

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
  String price;
  String img;
  String color;
  String details;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 196 / Get.height,
                  width: Get.width * 375 / Get.width,
                  child: Stack(children: [
                    InkWell(
                      onTap: () {
                        Get.to(ImgView(img: img));
                      },
                      child: Hero(
                        tag: "img",
                        child: Image.network(
                          img,
                          height: Get.height * 196 / Get.height,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: Get.height * 98 / Get.height,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon:
                                const Icon(Icons.arrow_back_ios_new_outlined))),
                    Positioned(
                        right: Get.height * 10 / Get.height,
                        top: Get.height * 98 / Get.height,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.star_border_outlined),
                        )),
                  ]),
                ),
                SizedBox(
                  height: Get.height * 10 / Get.height,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: Get.height * 40 / Get.height,
                        width: Get.height * 160 / Get.height,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffEBEBEB)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(children: [
                            const Text(
                              "Size",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            const Text("XL"),
                          ]),
                        ),
                      ),
                      Container(
                        height: Get.height * 40 / Get.height,
                        width: Get.height * 160 / Get.height,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffEBEBEB)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(children: [
                            const Text(
                              "Color",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Container(
                              height: Get.height * 20 / Get.height,
                              width: Get.height * 20 / Get.height,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(int.parse("0xff${color}"))),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: Get.height * 240 / Get.height,
                    width: Get.width * 343 / Get.width,
                    decoration: BoxDecoration(),
                    child: Text(
                      "$details",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        textBaseline: TextBaseline.alphabetic,
                        height: 1.9,
                      ),
                    )),
                SizedBox(
                  height: Get.height * 10 / Get.height,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: Get.height * 80 / Get.height,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffEBEBEB)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "$price",
                                      style: TextStyle(
                                          fontSize: 18, color: primaryColor),
                                    ),
                                  ]),
                              defSmallButton(
                                  ontap: () {
                                    print("onnnnn tap");
                                    final cont = Get.put(CartViewModel());
                                    cont.addToCart(CartProduct(
                                        name: name,
                                        img: img,
                                        price: price,
                                        count: 2));
                                  },
                                  txt: "Add to cart"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
