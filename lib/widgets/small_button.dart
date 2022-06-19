import 'package:flutter/material.dart';
import 'package:get/get.dart';

class defSmallButton extends StatelessWidget {
  defSmallButton({
    Key? key,
    required this.txt,
    required this.ontap,
  }) : super(key: key);
  final String txt;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 50 / Get.height,
      width: Get.width * 146 / Get.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(),
          onPressed: () {},
          child: Text(
            "Add",
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
    );
  }
}
