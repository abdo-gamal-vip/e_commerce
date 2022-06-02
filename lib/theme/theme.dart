import 'package:flutter/material.dart';

import '../helper/conests.dart';

ThemeData getThemeData() {
  return ThemeData(
      colorScheme: ColorScheme(
          background: primaryColor,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Color(0xff),
          onError: Colors.red.withOpacity(0.5),
          onPrimary: Color(0xff),
          onSecondary: Colors.blue,
          onSurface: Colors.grey,
          primary: Colors.green,
          secondary: Colors.blueAccent,
          surface: Colors.greenAccent),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor))));
}
