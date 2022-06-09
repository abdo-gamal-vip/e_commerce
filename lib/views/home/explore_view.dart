import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.search),
              height: Get.height * 65 / Get.height,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50)),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
