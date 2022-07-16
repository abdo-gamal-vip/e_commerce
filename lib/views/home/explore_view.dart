import 'package:e_commerce/helper/conests.dart';
import 'package:e_commerce/models/best_selling_model.dart';
import 'package:e_commerce/view_models/explore_view_model.dart';
import 'package:e_commerce/views/home/prodact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExploreView extends GetWidget<ExploreViewModel> {
  ExploreView({Key? key}) : super(key: key);
  final controller = Get.put(ExploreViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: GetBuilder<ExploreViewModel>(
              builder: (cont) => Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.search),
                    height: Get.height * 40 / Get.height,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
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
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                      height: 812 * 80 / Get.height,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.catList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 700 * 65 / Get.height,
                                width: 700 * 55 / Get.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Image.network(cont.catList[index].img),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text(cont.catList[index].name),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          " BestSelling",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.001,
                  ),
                  SizedBox(
                    height: 812 * 300 / Get.height,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.bestList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(ProductView(
                                  name: cont.bestList[index].name,
                                  color: cont.bestList[index].color,
                                  img: cont.bestList[index].img,
                                  details: cont.bestList[index].details,
                                  price: cont.bestList[index].price));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  cont.bestList[index].img,
                                  height: Get.height * 240 / Get.height,
                                  width: Get.width * 164 / Get.width,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cont.bestList[index].name),
                                    Text(cont.bestList[index].brand,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                    Text(
                                      cont.bestList[index].price,
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
