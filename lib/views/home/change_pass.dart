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

class ChangePass extends GetWidget<AuthViewModel> {
  ChangePass({Key? key}) : super(key: key);
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final controller = Get.put(AuthViewModel());
  TextEditingController namePasscon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.green,
            ),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 5 / Get.height,
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
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Image.network(
                                    "https://cdn.dribbble.com/users/7523955/screenshots/15709851/media/3a333103b7e71d00d239b30ecd995178.jpg?compress=1&resize=400x300&vertical=top")
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Change password, ",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 40 / Get.height,
                          ),
                          SizedBox(
                            height: Get.height * 20 / Get.height,
                          ),
                          Text("New Password",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff929292))),
                          TextFormField(
                            controller: namePasscon,
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
                                  txt: "Change Password",
                                  ontap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      try {
                                        final password = await namePasscon.text;
                                        await controller.changepss(password);
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
