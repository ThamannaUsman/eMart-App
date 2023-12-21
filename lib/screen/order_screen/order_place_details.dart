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
                  color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            Text(
              "$d1",
              style: TextStyle(
                  color: Colors.teal.shade600, fontWeight: FontWeight.bold),
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
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              Text(
                "$d2",
                style: TextStyle(
                    color: Colors.teal.shade600, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
