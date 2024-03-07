import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/screen/category_screen/category_screen.dart';
import 'package:ecommerce_app/screen/home_screen/brand_logo.dart';
import 'package:ecommerce_app/screen/home_screen/top_sale.dart';
import 'package:flutter/material.dart';

class HomeButton2 extends StatelessWidget {
  const HomeButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: whiteColor,
          ),
          height: 100,
          width: 100,

          child:   GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://cdn3.iconfinder.com/data/icons/e-commerce-756/24/categories_ui_apps_menu_options_add_interface-128.png",height: 40,),
                const SizedBox(height: 5,),
                const Text("Top Categories",)
              ],
            ),
          ),


        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: whiteColor,
          ),
          height: 100,
          width: 100,

          child:   GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Brand()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://cdn0.iconfinder.com/data/icons/complete-version-1/1024/bulb4-128.png",height: 40,),
                const SizedBox(height: 5,),
                const Text("Brand",)
              ],
            ),
          ),


        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: whiteColor,
          ),
          height: 100,
          width: 100,

          child:   GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TodaySale()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://cdn4.iconfinder.com/data/icons/eon-ecommerce-i-1/32/top_king_crown_seller-128.png",height: 40,),
                const SizedBox(height: 5,),
                const Text("Top Sale",)
              ],
            ),
          ),


        ),
      ],
    );
  }
}
