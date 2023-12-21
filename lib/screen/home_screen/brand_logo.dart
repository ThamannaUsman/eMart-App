import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.teal.shade100),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: whiteColor,
                    height: 10,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Image.network(brandname[index], width: 150,
                          height: 150,
                          ),
                      ),
                    ),
                  ),
                );
              },),
          ),
        )
    );
  }
}
