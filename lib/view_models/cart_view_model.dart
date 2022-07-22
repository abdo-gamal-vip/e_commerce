import 'package:e_commerce/helper/db_helper.dart';
import 'package:e_commerce/models/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/view_models/cart_view_model.dart';

class CartViewModel extends GetxController {
  List<CartProduct> cartList = [];
  TextEditingController street1controller = TextEditingController();
  TextEditingController street2controller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController zipcontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  PageController pageController = PageController();
  String Street1 = '';
  String Street2 = '';
  String City = '';
  String State = '';
  String Zip = '';
  String Country = '';
  late DBHelper dbHelper;
  int total = 0;

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
      calcTotal();
      if (cartList.isEmpty) {
        total = 0;
      }
      update();
    });
  }

  Future<void> deleteFromCart(int id) async {
    await dbHelper.delete(id);
    getAllToCard();
  }

  int calcTotal() {
    dbHelper.allProducts().then((value) {
      total = 0;
      for (var i in value) {
        total = total +
            (int.parse(i['price'].toString())) *
                int.parse(i['count'].toString());
      }
    });
    return total;
  }

  void increaseCount(int index) {
    cartList[index].count++;
    dbHelper.updateId(cartList[index]).then((value) {
      calcTotal();
      update();
    });
  }

  void decreasecount(int index) {
    if (cartList[index].count != 1) {
      cartList[index].count--;
      dbHelper.updateId(cartList[index]).then((value) {
        calcTotal();
        update();
      });
    }
  }
}
