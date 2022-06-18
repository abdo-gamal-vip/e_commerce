import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImgView extends StatelessWidget {
  ImgView({Key? key, required this.img}) : super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
        tag: "img",
        child: Image.network(
          img,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
