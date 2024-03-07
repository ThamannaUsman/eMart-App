import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class FleshDeal extends StatelessWidget {
  const FleshDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 250),
            itemBuilder: (context, index) {
              return Container(
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(fleshImage[index], width: 150,
                        height: 150,
                        ),
                    ),
                    const SizedBox(height: 10,),
                    Text("${fleshName[index]}", style: const TextStyle(
                      color: black87Color, fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center,),
                    const SizedBox(height: 6,),
                    Text(' \₹' + "${fleshPrice[index]}", style: TextStyle(
                        color: tealShade400,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            },),
        )
    );
  }
}
