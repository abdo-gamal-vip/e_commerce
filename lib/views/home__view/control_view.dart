import 'package:e_commerce/view_models/auth_view_model.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  ControlView({Key? key}) : super(key: key);
  final controller = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
