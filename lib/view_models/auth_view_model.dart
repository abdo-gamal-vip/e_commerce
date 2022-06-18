import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/views/home/home_vIew.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userref = FirebaseFirestore.instance.collection('users');

  Future<void> signUp(String email, String password) async {
    var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (result != null) {
      Get.back();
      Get.snackbar("ok", "Sign up success",
          snackPosition: SnackPosition.values[Random().nextInt(3)]);
      print(result.user!.uid);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result != null) {
        Get.to(HomeView());
        await userref.doc().set({
          "email": email,
          "password": password,
          "uid": result.user!.uid,
        });
        Get.snackbar("ok", "Sign in success",
            snackPosition: SnackPosition.BOTTOM);

        print(result.user!.uid);
      }
    } catch (e) {
      if (e.toString() ==
              "[firebase_auth/wrong-password] The password is invalid or the user does not have a password." ||
          e.toString() ==
              "Ignoring header X-Firebase-Locale because its value was null.") {
        Get.snackbar("error",
            "The password is invalid or the user does not have a password",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.toString() ==
          "[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred") {
        Get.snackbar("connection error", "Check your Connection");
      } else {
        Get.snackbar("error", "please try again ");
      }
      print(e);
    }
  }
}
