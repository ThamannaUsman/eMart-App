import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/screen/category_screen/item_details.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class FeatureProduct extends StatelessWidget {
  const FeatureProduct({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingIndicator loading = LoadingIndicator();
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(gradient: LinearGradient(colors: backgroundGradient)),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Featured Product",style: TextStyle(fontWeight: FontWeight.bold,color: whiteColor,fontSize: 18),),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection:Axis.horizontal ,
            child: FutureBuilder(
              future: FirebaseServices.getFeaturedProducts(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: loading.loadingIndicator(),);
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No featured products",
                      style: TextStyle(color: whiteColor,)));
                } else {
                  var featuredProductsData=snapshot.data!.docs;
                  return Row(
                      children: List.generate(featuredProductsData.length, (index) =>
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,   MaterialPageRoute(builder: (context) {
                                return ItemDetails(title:"${featuredProductsData[index]['p_name']}" ,data: featuredProductsData[index],);
                              },));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                color: whiteColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        featuredProductsData[index]['p_imgs'], width: 150,
                                        height: 150,
                                        ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(" ${featuredProductsData[index]['p_name']}",
                                      style: const TextStyle(
                                        color: black87Color,
                                        fontWeight: FontWeight.bold,),
                                      textAlign: TextAlign.center,),
                                    const SizedBox(height: 6,),
                                    Text(' \₹' + "${featuredProductsData[index]['p_price']}",
                                      style: TextStyle(
                                          color: tealShade400,
                                          fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ))

                  );
                }
              }
            ),
          )
        ],
      ),
    );
  }
}
