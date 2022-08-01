import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AccountViweModel extends GetxController {
  String? name;
  String? email;
  CollectionReference userRef = FirebaseFirestore.instance.collection('body');
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
  List<OrderModel> ordersList = [];

  Future<void> GetData() async {
    await userRef
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      email = value.docs[0]['email'];
      name = value.docs[0]['name'];
      print(name);
    });
  }

  Future<void> getOrders() async {
    ordersList.clear();
    await ordersRef
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      for (var i in value.docs) {
        ordersList.add(OrderModel(
            adderss: i['adderss'],
            isDelivired: i['isDelivired'],
            img: i['order'][0]['img']));
        print(value.docs);
      }
      update();
    });
  }

  @override
  void onInit() {
    GetData();
    getOrders();
    super.onInit();
  }
}
