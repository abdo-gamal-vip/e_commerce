import 'package:e_commerce/helper/db_helper.dart';
import 'package:e_commerce/models/cart_product.dart';
import 'package:get/get.dart';
import 'package:e_commerce/view_models/cart_view_model.dart';

class CartViewModel extends GetxController {
  List<CartProduct> cartList = [];
  late DBHelper dbHelper;
  @override
  void onInit() {
    dbHelper = DBHelper();
    dbHelper.createDatabase();
    getAllToCard();
    super.onInit();
  }

  Future<void> addToCart(CartProduct cartProduct) async {
    await dbHelper.createPruduct(cartProduct);
    getAllToCard();
  }

  Future<void> getAllToCard() async {
    cartList.clear();
    dbHelper.allProducts().then((value) {
      for (var i in value) {
        cartList.add(CartProduct.fromMap(i));
      }
      update();
    });
  }
}
