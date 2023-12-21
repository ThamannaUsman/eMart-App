import 'package:flutter/material.dart';

class Utils {
  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding:const EdgeInsets.all(8.0) ,
        backgroundColor: Colors.teal.shade200,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(content),
              ),
            ],
          ),
        )));
  }

  Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
