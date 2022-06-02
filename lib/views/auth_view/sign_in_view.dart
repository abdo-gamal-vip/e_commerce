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
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor))),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
