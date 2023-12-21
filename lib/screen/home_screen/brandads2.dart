import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class BrandAdWidget2 extends StatefulWidget {
  const BrandAdWidget2({super.key});

  @override
  State<BrandAdWidget2> createState() => _BrandAdWidget2State();
}

class _BrandAdWidget2State extends State<BrandAdWidget2> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentIndex == (brandList2.length - 1)) {
          currentIndex = -1;
        }
        setState(() {
          currentIndex++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            brandList2[currentIndex],
            width: double.infinity,
          ),


        ],
      ),
    );
  }
}
