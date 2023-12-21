import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class BrandAdWidget3 extends StatefulWidget {
  const BrandAdWidget3({super.key});

  @override
  State<BrandAdWidget3> createState() => _BrandAdWidget3State();
}

class _BrandAdWidget3State extends State<BrandAdWidget3> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentIndex == (brandList3.length - 1)) {
          currentIndex = -1;
        }
        setState(() {
          currentIndex++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            brandList3[currentIndex],
            width: double.infinity,
            height: 400,
          ),


        ],
      ),
    );
  }
}
