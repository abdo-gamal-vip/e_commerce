import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/views/auth_view/sign_in_view.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "E-commerce",
    theme: ThemeData(
      colorScheme: ColorScheme(
          background: primaryColor,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Color(0xff),
          onError: Colors.red.withOpacity(0.5),
          onPrimary: Color(0xff),
          onSecondary: Colors.blue,
          onSurface: Colors.yellow,
          primary: Colors.green,
          secondary: Colors.blueAccent,
          surface: Colors.greenAccent),
    ),
    home: SignInView(),
  ));
}
