import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/screen/home_screen/flesh_deal.dart';
import 'package:ecommerce_app/screen/home_screen/today_deals.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: whiteColor,
          ),
          height: 100,
          width: 140,

          child:   GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TodayDeal(),));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://cdn1.iconfinder.com/data/icons/seo-and-digital-marketing-2/20/98-128.png",height: 40,),
                const SizedBox(height: 5,),
                const Text("Today's Deal",)
              ],
            ),
          ),


        ),
        const SizedBox(width: 18,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            color: whiteColor,
          ),
          height: 100,
          width: 140,

          child:   GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FleshDeal(),));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://cdn3.iconfinder.com/data/icons/strokeline/128/21_icons-128.png",height: 40,),
                const SizedBox(height: 5,),
                const Text("Flash Sale",)
              ],
            ),
          ),


        ),

      ],
    );
  }
}
