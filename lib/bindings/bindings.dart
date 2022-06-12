import 'package:e_commerce/models/best_selling_model.dart';
import 'package:e_commerce/view_models/auth_view_model.dart';
import 'package:e_commerce/view_models/explore_view_model.dart';
import 'package:e_commerce/views/home/explore_view.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ExploreViewModel());
    Get.lazyPut(() => BestSellingModel());
  }
}
