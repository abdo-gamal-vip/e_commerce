import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AccountViweModel extends GetxController {
  String? name;
  String? email;
  CollectionReference userRef = FirebaseFirestore.instance.collection('body');

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

  @override
  void onInit() {
    GetData();
    super.onInit();
  }
}
