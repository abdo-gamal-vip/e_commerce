import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignInView extends GetWidget<AuthViewModel> {
  final controller = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 95 / Get.height,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                  color: backGroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "welcome, ",
                          style: TextStyle(fontSize: 30),
                        ),
                        Spacer(),
                        InkWell(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Sign In To Continue, ",
                      style: TextStyle(fontSize: 14, color: Color(0xff929292)),
                    ),
                    SizedBox(
                      height: Get.height * 40 / Get.height,
                    ),
                    const Text("Email",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff929292))),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Example@gmail.com",
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 20 / Get.height,
                    ),
                    Text("password",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff929292))),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: ".........",
                          hintStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: Get.height * 20 / Get.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [InkWell(child: Text("forget password ?"))],
                    ),
                    SizedBox(
                      height: Get.height * 20 / Get.height,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          height: Get.height * 50 / Get.height,
                          width: Get.width * 311 / Get.width,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                  ]),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 15 / Get.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "-OR-",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
