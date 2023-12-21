import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

Widget orderStatus({icon,color,title,showDone}) {
  return ListTile(
    leading: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: color)),

        child: Icon(
          icon,
          color: color,
        )),
    trailing: SizedBox(
      height: 100,
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Text(
            "$title",
            style: const TextStyle(
                color: Colors.black87),
          ),
          showDone ? Icon(Icons.done,color: Colors.teal.shade600,):Container()
        ],
      ),
    ),
  );
}
