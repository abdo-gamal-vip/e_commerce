import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/view_models/account_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TrackOrderView extends GetWidget<AccountViweModel> {
  TrackOrderView({Key? key}) : super(key: key);
  final controller = Get.put(AccountViweModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Track Order",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.getOrders();
          },
          child: GetBuilder<AccountViweModel>(
            builder: (contt) => ListView.builder(
                itemCount: controller.ordersList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      width: 375 * 343 / Get.width,
                      height: 812 * 140 / Get.height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                ),
                                Text(
                                  controller.ordersList[index].adderss,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.green)),
                                    child: Image.network(
                                      fit: BoxFit.fill,
                                      controller.ordersList[index].img,
                                      height: 250,
                                      width: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                controller.ordersList[index].isDelivired
                                    ? Container(
                                        height: 30,
                                        width: 80,
                                        color: primaryColor,
                                        child: Center(child: Text("Deleverd")),
                                      )
                                    : Container(
                                        height: 30,
                                        width: 80,
                                        color: Colors.yellow,
                                        child:
                                            Center(child: Text("In Transit")),
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
