import 'package:ecommerce_app/const_final/const.dart';
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
                Image.network("https://cdn2.iconfinder.com/data/icons/boxicons-regular-vol-1/24/bx-category-128.png",height: 40,),
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
                Image.network("https://cdn2.iconfinder.com/data/icons/smart-home-176/24/light_bulb_light_bulb_idea_lightning_foco_lightbulb_ideas_technology-128.png",height: 40,),
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
                Image.network("https://cdn4.iconfinder.com/data/icons/materia-flat-holiday/24/029_019_crown_corona_cesar_king_leader_jewel_diamond-128.png",height: 40,),
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
