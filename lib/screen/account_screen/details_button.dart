import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final String? title;
  final String? count;
  const DetailsButton({super.key,required this.title,required this.count});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: whiteColor,
        ),
        width: 90,
        height: 70,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count!,
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 16),
            ),
            const SizedBox(height: 5,),
            Text(
              title!,
              style: const TextStyle(
                color: Colors.black87,),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
