import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/views/auth_view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "E-commerce",
    theme: getThemeData(),
    home: SignInView(),
  ));
}
