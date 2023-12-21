import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/screen/category_screen/item_details.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    LoadingIndicator loading = LoadingIndicator();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.teal.shade700,
            appBar: AppBar(
              backgroundColor: Colors.teal.shade600,
              title: Text(title!),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                          productController.subCat.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  productController.switchCategory(
                                    "${productController.subCat[index]}",
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    width: 120,
                                    height: 60,
                                    // productController.getSubCategories(productName2[index]);
                                    child: Center(
                                        child: Text(
                                      "${productController.subCat[index]}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    )),
                                  ),
                                ),
                              ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder(
                  stream: productController.productMethod,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child:Container(),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          "No products found!",
                          style: TextStyle(color: Colors.black87),
                        ),
                      );
                    } else {
                      var data = snapshot.data!.docs;
                      return Expanded(
                          child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 250),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              productController.checkIfFav(data[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemDetails(
                                    title: "${data[index]['p_name']}",
                                    data: data[index],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: whiteColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        data[index]['p_imgs'],
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${data[index]['p_name']}",
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '\₹' + "${data[index]['p_price']}",
                                      style: TextStyle(
                                          color: Colors.teal.shade400,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ));
                    }
                  },
                ),
              ],
            )));
  }
}
