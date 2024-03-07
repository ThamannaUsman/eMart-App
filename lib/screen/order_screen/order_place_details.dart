import 'package:ecommerce_app/const_final/color.dart';
import 'package:flutter/material.dart';

Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title1",
              style: const TextStyle(
                  color: black87Color, fontWeight: FontWeight.bold),
            ),
            Text(
              "$d1",
              style: TextStyle(
                  color: tealShade600, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title2",
                style: const TextStyle(
                    color: black87Color, fontWeight: FontWeight.bold),
              ),
              Text(
                "$d2",
                style: TextStyle(
                    color: tealShade600, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
