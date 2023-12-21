import 'package:ecommerce_app/const_final/const.dart';
import 'package:flutter/material.dart';

class TodayDeal extends StatelessWidget {
  const TodayDeal({super.key});

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
                    child: Image.network(totalImage[index], width: 150,
                      height: 150,
                      ),
                  ),
                  const SizedBox(height: 10,),
                  Text("${totalName[index]}", style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,),
                  const SizedBox(height: 6,),
                  Text(' \₹' + "${totalPrice[index]}", style: TextStyle(
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
