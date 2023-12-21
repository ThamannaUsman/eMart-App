import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/screen/category_screen/rating_screen.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({
    super.key,
    this.title,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    LoadingIndicator loading = LoadingIndicator();

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              productController.resetValues();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          title!,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Share.share(data['p_imgs']);
              },
              icon: const Icon(
                Icons.share,
                color: whiteColor,
              )),
          IconButton(
              onPressed: () {
                if (productController.isFav) {
                  productController.removeFromWishList(data.id, context);
                } else {
                  productController.addToWishList(data.id, context);
                }
              },
              icon: Icon(
                Icons.favorite_outlined,
                color: productController.isFav ? Colors.red : Colors.grey,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    data['p_imgs'],
                    width: 300,
                    height: 250,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Row(
                  //   children: [
                  //     Text("${data['p_category']}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                  //     Text(" ${data['p_subcategory']}",style: const TextStyle(color: Colors.black),),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  //  RatingScreen(
                  //   value: data['p_rating'],
                  // ),
                RatingBarScreen(rating: data['p_rating']),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\₹'+"${data['p_price']}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade300),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "  Seller",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "  ${data['p_seller']}",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: whiteColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Colors: ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade300),
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                      data['p_colors'].length,
                                      (index) => GestureDetector(
                                            onTap: () {
                                              productController
                                                  .changeColorIndex(index);
                                            },
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 6),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    child: CircleAvatar(
                                                      backgroundColor: Color(
                                                          data['p_colors']
                                                              [index]),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                    visible: index ==
                                                        productController
                                                            .colorIndex,
                                                    child: const Icon(
                                                      Icons.done,
                                                      color: whiteColor,
                                                    )),
                                              ],
                                            ),
                                          )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: whiteColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Quantity: ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade300),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          productController.decreaseQuantity();
                                          productController.calculateTotalPrice(
                                              double.parse(data['p_price']));
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.black87,
                                        )),
                                    Text(
                                      "${productController.quantity}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          productController.increaseQuantity(
                                              double.parse(data['p_quantity']));
                                          productController.calculateTotalPrice(
                                              double.parse(data['p_price']));
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.black87,
                                        )),
                                    Text(
                                      "(${data['p_quantity']} available)",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade300),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: whiteColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Total: ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade300),
                                  ),
                                ),
                                Text(
                                  "${productController.totalPrice}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal.shade600),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${data['p_desc']} ",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Products you may also like",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection:Axis.horizontal ,
                    child: FutureBuilder(
                        future: FirebaseServices.getFeaturedProducts(),
                        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: loading.loadingIndicator(),);
                          } else if (snapshot.data!.docs.isEmpty) {
                            return const Center(child: Text("No featured products",
                                style: TextStyle(color: Colors.white,)));
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
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,),
                                                textAlign: TextAlign.center,),
                                              const SizedBox(height: 6,),
                                              Text(' \₹' + "${featuredProductsData[index]['p_price']}",
                                                style: TextStyle(
                                                    color: Colors.teal.shade400,
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
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal.shade500),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder())),
                  onPressed: () {
                   if(productController.quantity > 0){
                     productController.addToCart(
                         color: data['p_colors'][productController.colorIndex],
                         context: context,
                         img: data['p_imgs'],
                         qty: productController.quantity,
                         vendorId: data['vendor_id'],
                         sellername: data['p_seller'],
                         title: data['p_name'],
                         tprice: productController.totalPrice);
                     Utils()
                         .showSnackBar(context: context, content: "Added to Cart");
                   }else{
                     Utils()
                         .showSnackBar(context: context, content: "Minimum 1 product is required");
                   }
                  },
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    );
  }
}


