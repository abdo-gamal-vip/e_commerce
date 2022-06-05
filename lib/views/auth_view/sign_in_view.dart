import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/view_models/auth_view_model.dart';
import 'package:e_commerce/views/auth_view/sign_up_view.dart';
import 'package:e_commerce/widgets/defult_big_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInView extends GetWidget<AuthViewModel> {
  final controller = Get.put(AuthViewModel());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 95 / Get.height,
              ),
              Form(
                key: _formkey,
                child: Container(
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
                          children: [
                            const Text(
                              "welcome, ",
                              style: TextStyle(fontSize: 30),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(SignUpView());
                              },
                              child: const Text(
                                "Sign Upp",
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
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff929292)),
                        ),
                        SizedBox(
                          height: Get.height * 40 / Get.height,
                        ),
                        const Text("Email",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff929292))),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Example@gmail.com",
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 20 / Get.height,
                        ),
                        Text("password",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff929292))),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
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
                          children: const [
                            InkWell(child: Text("forget password ?"))
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 20 / Get.height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefultBigButton(
                                txt: "signin",
                                ontap: () {
                                  if (_formkey.currentState!.validate()) {}
                                }),
                          ],
                        )
                      ]),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 15 / Get.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "-OR-",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 15 / Get.height,
                    ),
                    Container(
                        height: Get.height * 50 / Get.height,
                        width: Get.width * 310 / Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/facebook.svg",
                            ),
                            Text("Sign in with facebook"),
                          ],
                        )),
                    SizedBox(
                      height: Get.height * 11 / Get.height,
                    ),
                    Container(
                        height: Get.height * 50 / Get.height,
                        width: Get.width * 311 / Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/google.svg",
                            ),
                            Text("Sign in with google"),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
