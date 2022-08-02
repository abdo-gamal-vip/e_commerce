import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/view_models/account_view_model.dart';
import 'package:e_commerce/views/auth_view/sign_in_view.dart';
import 'package:e_commerce/views/home/change_pass.dart';
import 'package:e_commerce/views/home/home_vIew.dart';
import 'package:e_commerce/views/home/track_order_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountView extends GetWidget<AccountViweModel> {
  AccountView({Key? key}) : super(key: key);

  final controller = Get.put(AccountViweModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 812 * 120 / Get.height,
                      width: 812 * 120 / Get.height,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(0.20),
                      ),
                      child: Icon(
                        Icons.person,
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      width: 812 * 200 / Get.height,
                      height: 812 * 100 / Get.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.name.toString() == null
                                ? 'loading name'
                                : controller.name.toString(),
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w500),
                          ),
                          Text(controller.email.toString() == null
                              ? 'loading email'
                              : controller.email.toString()),
                          InkWell(
                              onTap: () {
                                Get.to(ChangePass());
                              },
                              child: Text(
                                "change password",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                    onTap: () {
                      Get.to(HomeView());
                    },
                    leading: Image.asset("assets/svg/editprofile.png"),
                    title: Text("Edit Profile"),
                    trailing: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(TrackOrderView());
                    },
                    leading: Image.asset("assets/svg/editprofile.png"),
                    title: Text("Tracking Order"),
                    trailing: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(HomeView());
                    },
                    leading: Image.asset("assets/svg/editprofile.png"),
                    title: Text("Notifications"),
                    trailing: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(SignInView());
                    },
                    leading: Icon(
                      Icons.logout,
                      color: primaryColor,
                    ),
                    title: Text("Sign out"),
                    trailing: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
