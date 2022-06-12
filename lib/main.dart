import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view_models/auth_view_model.dart';
import 'package:e_commerce/views/auth_view/sign_in_view.dart';
import 'package:e_commerce/views/home/home_vIew.dart';
import 'package:e_commerce/widgets/defult_big_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "E-commerce",
    theme: getThemeData(),
    home: SignInView(),
  ));
}
