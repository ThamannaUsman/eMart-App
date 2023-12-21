import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class BrandAdWidget extends StatefulWidget {
  const BrandAdWidget({super.key});

  @override
  State<BrandAdWidget> createState() => _BrandAdWidgetState();
}

class _BrandAdWidgetState extends State<BrandAdWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentIndex == (brandslist.length - 1)) {
          currentIndex = -1;
        }
        setState(() {
          currentIndex++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            brandslist[currentIndex],
            width: double.infinity,
          ),


        ],
      ),
    );
  }
}
