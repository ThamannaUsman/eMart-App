import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/screen/category_screen/category_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController=Provider.of<ProductController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal.shade600,
          title: const Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: whiteColor
            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    productController.getSubCategories(productName2[index]);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetails(title: productName2[index]),));
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
                            child: Image.network(product2[index],width: 150,height:150,),
                          ),
                          const SizedBox(height: 10,),
                          Text(productName2[index],style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),

                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
