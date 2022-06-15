import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/best_selling_model.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ExploreViewModel extends GetxController {
  List<CategoryModel> catList = [];
  List<BestSellingModel> bestList = [];
  CollectionReference bestref =
      FirebaseFirestore.instance.collection('BestSelling');
  CollectionReference categoryref =
      FirebaseFirestore.instance.collection('categories');

  Future<void> getCatList() async {
    await categoryref.get().then((value) {
      for (var i in value.docs) {
        catList.add(CategoryModel.fromMap(i));
        print(i["name"]);
      }
      update();
    });
  }

  Future<void> getBestList() async {
    await bestref.get().then((value) {
      for (var y in value.docs) {
        bestList.add(BestSellingModel.fromMap(y));
        print(y["name"]);
        update();
      }
    });
  }

  @override
  void onInit() {
    getCatList();
    getBestList();
    super.onInit();
  }
}
