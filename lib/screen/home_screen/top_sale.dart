import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class TodaySale extends StatelessWidget {
  const TodaySale({super.key});

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
                      child: Image.network(saleImage[index], width: 150,
                        height: 150,
                        ),
                    ),
                    const SizedBox(height: 10,),
                    Text("${saleName[index]}", style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center,),
                    const SizedBox(height: 6,),
                    Text(' \₹' + "${salePrice[index]}", style: TextStyle(
                        color: Colors.teal.shade400,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            },),
        )
    );
  }
}
