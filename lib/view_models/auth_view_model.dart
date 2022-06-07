import 'package:e_commerce/views/home__view/home_vIew.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (result != null) {
      Get.back();
      Get.snackbar("ok", "Sign up success",
          snackPosition: SnackPosition.BOTTOM);
      print(result.user!.uid);
    }
  }

  Future<void> signIn(String email, String password) async {
    var result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (result != null) {
      Get.to(HomeView());
      Get.snackbar("ok", "Sign up success",
          snackPosition: SnackPosition.BOTTOM);
      print(result.user!.uid);
    }
  }
}
