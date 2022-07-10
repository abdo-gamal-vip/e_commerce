import 'package:e_commerce/view_models/home_view_model.dart';
import 'package:e_commerce/views/home/account_view.dart';
import 'package:e_commerce/views/home/cart_view.dart';
import 'package:e_commerce/views/home/explore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> bodyList = [
    ExploreView(),
    CartView(),
    AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedFontSize: 15,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // selectedIconTheme: IconThemeData(size: 25),

          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/explorer.svg"),
                activeIcon:
                    Image(image: Image.asset("assets/Explore1.png").image),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/cart.svg"),
                activeIcon: Image(image: Image.asset("assets/Cart1.png").image),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/account.svg"),
                activeIcon:
                    Image(image: Image.asset("assets/Account1.png").image),
                label: "Account"),
          ]),
      body: bodyList[currentIndex],
    );
  }
}
