import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/screen/account_screen/account_screen.dart';
import 'package:ecommerce_app/screen/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/screen/category_screen/category_screen.dart';
import 'package:ecommerce_app/screen/home_screen/home_screen.dart';
import 'package:ecommerce_app/screen/sell_screen/screen_product.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexNum = 0;

  @override
  Widget build(BuildContext context) {
    var navbarItems = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: "Home"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined), label: "Categories"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.sell_outlined), label: "Sell"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_box_outlined), label: "Account"),

    ];
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ScreenProduct(),
      const AccountScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNum,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: whiteColor,
        unselectedItemColor: Colors.black87,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        backgroundColor: Colors.teal.shade600,
        items: navbarItems,
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
      ),
      body: Container(
        child: navBody.elementAt(indexNum),
      ),
    );
  }
}
