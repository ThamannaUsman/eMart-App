import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/screen/home_screen/brandAds1.dart';
import 'package:ecommerce_app/screen/home_screen/brandads2.dart';
import 'package:ecommerce_app/screen/home_screen/brandads3.dart';
import 'package:ecommerce_app/screen/home_screen/feature_product.dart';
import 'package:ecommerce_app/screen/home_screen/homeButton1.dart';
import 'package:ecommerce_app/screen/home_screen/homeButton2.dart';
import 'package:ecommerce_app/screen/home_screen/product.dart';
import 'package:ecommerce_app/screen/home_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final homeController=Provider.of<HomeController>(context);
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12),
      color: greyShade200,
      width: screenSize.width,
      height: screenSize.height,
      child: SafeArea(
        child: Column(
          children: [
            Container(
                color: greyColor,
                child: TextFormField(
                  controller: homeController.searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon:IconButton(onPressed: (){
                      if(homeController.searchController.text.isNotEmpty){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SearchScreen(title: homeController.searchController.text,),));

                      }
                    }, icon:  Icon(
                      Icons.search,
                      color: tealShade600,
                    ),),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Search anything...",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: greyShade400),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: tealShade600, width: 2),
                    ),
                  ),
                )),
            const SizedBox(
              height: 4,
            ),
             const Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    BrandAdWidget1(),
                    SizedBox(
                      height: 8,
                    ),
                    HomeButton1(),
                    SizedBox(
                      height: 10,
                    ),
                    BrandAdWidget2(),
                    SizedBox(
                      height: 10,
                    ),
                    HomeButton2(),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Featured Categories",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FeatureProduct(),
                    SizedBox(
                      height: 10,
                    ),
                    BrandAdWidget3(),
                    SizedBox(
                      height: 10,
                    ),
                    Product()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
