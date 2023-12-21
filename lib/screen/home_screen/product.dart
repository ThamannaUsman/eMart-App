import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/screen/category_screen/item_details.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingIndicator loading = LoadingIndicator();
    return StreamBuilder(
      stream: FirebaseServices.allProducts(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData){
          return loading.loadingIndicator();
        }else {
          var allProductsdata=snapshot.data!.docs;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allProductsdata.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 250),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,   MaterialPageRoute(builder: (context) {
                    return ItemDetails(title:"${allProductsdata[index]['p_name']}" ,data: allProductsdata[index],);
                  },));
                },
                child: Container(
                  color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(allProductsdata[index]['p_imgs'], width: 150,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text("${allProductsdata[index]['p_name']}", style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,),
                      const SizedBox(height: 6,),
                      Text(' \₹' + "${allProductsdata[index]['p_price']}", style: TextStyle(
                          color: Colors.teal.shade400,
                          fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              );
            },);
        }
      }
    );
  }
}
