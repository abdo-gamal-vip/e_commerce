import 'package:e_commerce/view_models/cart_view_model.dart';
import 'package:e_commerce/views/home/checkout_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../helper/conests.dart';
import '../../widgets/small_button.dart';
import 'checkout_view.dart';

class CartView extends GetWidget<CartViewModel> {
  CartView({Key? key}) : super(key: key);
  @override
  var r = 4;
  final controller = Get.put(CartViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CartViewModel>(
            builder: (cont) => Column(children: [
                  Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: double.infinity,
                        width: Get.width * 375 / Get.width,
                        child: ListView.builder(
                          itemCount: cont.cartList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onLongPress: (() {
                                cont.deleteFromCart(cont.cartList[index].id!);
                              }),
                              child: Container(
                                height: 812 * 120 / Get.height,
                                color: Colors.grey[200],
                                margin: const EdgeInsets.all(10),
                                child: Row(children: [
                                  Image.network(
                                    cont.cartList[index].img,
                                    height: 375 * 120 / Get.width,
                                    width: 375 * 120 / Get.width,
                                    fit: BoxFit.fill,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "  ${cont.cartList[index].name}",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          "\$${cont.cartList[index].price} ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: primaryColor),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 812 * 35 / Get.height,
                                          color: Colors.grey[300],
                                          child: Row(children: [
                                            IconButton(
                                                onPressed: () {
                                                  cont.increaseCount(index);
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 20,
                                                )),
                                            Text(cont.cartList[index].count
                                                .toString()),
                                            IconButton(
                                                onPressed: () {
                                                  cont.decreasecount(index);
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                )),
                                          ]),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            );
                          },
                        ),
                      )),
                  Container(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: double.infinity,
                            height: Get.height * 70 / Get.height,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffEBEBEB)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          "\$${cont.total}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: primaryColor),
                                        ),
                                      ]),
                                  defSmallButton(
                                      ontap: () {
                                        Get.to(checkout());
                                      },
                                      txt: "CheckOut"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ])),
      ),
    );
  }
}
