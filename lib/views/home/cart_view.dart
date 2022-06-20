import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../helper/conests.dart';
import '../../widgets/small_button.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
              flex: 7,
              child: SizedBox(
                height: double.infinity,
                width: Get.width * 375 / Get.width,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 812 * 120 / Get.height,
                      color: Colors.grey[200],
                      margin: EdgeInsets.all(10),
                      child: Row(children: [
                        Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/ecommerce-tech-show.appspot.com/o/best%20selling%2Fsa3a.png?alt=media&token=b90bcf43-8c0e-46d8-95d2-3f6ac1016ab3",
                          height: 375 * 120 / Get.width,
                          width: 375 * 120 / Get.width,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tag Heuer Wristwatch ",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "\$1500 ",
                                style: TextStyle(
                                    fontSize: 15, color: primaryColor),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 812 * 35 / Get.height,
                                color: Colors.grey[300],
                                child: Row(children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        size: 20,
                                      )),
                                  Text("1"),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.remove,
                                        size: 20,
                                      )),
                                ]),
                              )
                            ],
                          ),
                        )
                      ]),
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
                                  "\$1500",
                                  style: TextStyle(
                                      fontSize: 18, color: primaryColor),
                                ),
                              ]),
                          defSmallButton(ontap: () {}, txt: "CheckOut"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
