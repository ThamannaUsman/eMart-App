import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/screen/category_screen/item_details.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String? title;

  const SearchScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    LoadingIndicator loading = LoadingIndicator();
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: transparentColor,
          title: Text(title!, style: const TextStyle(color: greyColor),),
        ),
        body: FutureBuilder(
          future: FirebaseServices.searchProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loading.loadingIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text(
                    "Not products found",
                  ));
            } else {
              var data = snapshot.data!.docs;
              var filtered=data.where((element) => element['p_name'].toString().toLowerCase().contains(title!.toLowerCase())).toList();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 250), children: List.generate(filtered.length, (index) =>
                    Column(
                        children: [
                        GestureDetector(
                        onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ItemDetails(title:"${filtered[index]['p_name']}" ,data: filtered[index],);
                },));
                },
                  child: Container(
                    color: whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            filtered[index]['p_imgs'], width: 150,
                            height: 150,
                            fit: BoxFit.cover,),
                        ),
                        const SizedBox(height: 10,),
                        Text("${filtered[index]['p_name']}", style: const TextStyle(
                          color: black87Color, fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,),
                        const SizedBox(height: 6,),
                        Text(
                          ' \₹' + "${filtered[index]['p_price']}", style: TextStyle(
                            color: tealShade400,
                            fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                )
                ],
              )),)
            );
          }
          },
        ));
  }
}
