import 'dart:typed_data';

import 'package:ecommerce_app/controller/sell_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellController>(
      builder: (context, value, child) {
        return Stack(
          children: [
            value.image == null
                ? Image.network(
              "https://imgs.search.brave.com/tPW7l-v1-lngFb1OYMOuUQN6j_N9LXWIrrw1UBjjZpQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by91/c2VyLWZyb250LXNp/ZGUtd2l0aC13aGl0/ZS1iYWNrZ3JvdW5k/XzE4NzI5OS00MDAw/Ny5qcGc_c2l6ZT02/MjYmZXh0PWpwZw",
              height: 100,
            )
                : Image.memory(
              value.image!,
              height: 100,
            ),
            IconButton(
                onPressed: () async {
                  Uint8List? temp =
                  await value.pickImage();
                  if (temp != null) {
                    value.image = temp;
                  }
                },
                icon: const Icon(Icons.file_upload))
          ],
        );
      },

    );
  }
}

