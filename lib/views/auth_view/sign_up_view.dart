import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/view_models/auth_view_model.dart';
import 'package:e_commerce/widgets/defult_big_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final controller = Get.put(AuthViewModel());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
                        children: const [
                          Text(
                            "Sign Up, ",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 40 / Get.height,
                      ),
                      const Text("name",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff929292))),
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Type Your Name",
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 20 / Get.height,
                      ),
                      const Text("Email",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff929292))),
                      TextFormField(
                        controller: emailController,
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
                      Text("Password",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff929292))),
                      TextFormField(
                        controller: passController,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefultBigButton2(
                              txt: "sign Up",
                              ontap: () async {
                                if (_formkey.currentState!.validate()) {
                                  try {
                                    final newuser = await controller.signUp(
                                        emailController.text,
                                        passController.text);
                                  } catch (e) {
                                    Get.snackbar(e.toString(), "error");

                                    print(e);
                                  }
                                }
                              }),
                        ],
                      ),
                    ]),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 15 / Get.height,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
