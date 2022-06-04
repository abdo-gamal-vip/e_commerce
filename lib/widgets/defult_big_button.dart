import 'package:e_commerce/helper/conests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefultBigButton extends StatelessWidget {
  const DefultBigButton({
    Key? key,
    required this.txt,
    required this.ontap,
  }) : super(key: key);
  final String txt;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
          height: Get.height * 50 / Get.height,
          width: Get.width * 311 / Get.width,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor)),
              onPressed: () {
                ontap();
              },
              child: const Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))),
    );
  }
}
