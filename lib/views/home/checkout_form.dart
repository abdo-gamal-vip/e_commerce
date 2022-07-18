import 'package:e_commerce/view_models/cart_view_model.dart';
import 'package:e_commerce/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Checkform extends GetWidget<CartViewModel> {
  Checkform({Key? key}) : super(key: key);
  @override
  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Checkout",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Image.asset("assets/checkbox.png"),
              const Text(
                "Billing address is the same as delivery address",
                style: TextStyle(fontSize: 14),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "street 1 ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "21, Alex Davidson Avenue",
                    hintStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "street 2 ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Opposite Omegatron, Vicent Quarters",
                    hintStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "City ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Cairo .. alex .. elmanya",
                    hintStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "State ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Countery ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Lagos State",
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Nigeria",
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 150,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      defSmallButton(
                          txt: "Back",
                          ontap: () {
                            Get.back();
                          }),
                      defSmallButton(
                          txt: "Next",
                          ontap: () {
                            controller.pageController.animateToPage(1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }),
                    ]),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
