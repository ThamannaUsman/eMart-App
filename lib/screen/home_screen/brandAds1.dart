import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class BrandAdWidget1 extends StatefulWidget {
  const BrandAdWidget1({super.key});

  @override
  State<BrandAdWidget1> createState() => _BrandAdWidget1State();
}

class _BrandAdWidget1State extends State<BrandAdWidget1> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentIndex == (brandList1.length - 1)) {
          currentIndex = -1;
        }
        setState(() {
          currentIndex++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            brandList1[currentIndex],
            width: double.infinity,
          ),


        ],
      ),
    );
  }
}
