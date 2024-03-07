
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/const_final/color.dart';
// import 'package:ecommerce_app/const_final/const.dart';
// import 'package:ecommerce_app/const_final/firebase_const.dart';
// import 'package:ecommerce_app/controller/sell_controller.dart';
// import 'package:ecommerce_app/screen/admin_panel/dropdown.dart';
// import 'package:ecommerce_app/screen/admin_panel/imagescreen.dart';
// import 'package:ecommerce_app/services/firebase_services.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class SellScreen extends StatelessWidget {
//   const SellScreen({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     final sellController = Provider.of<SellController>(context);
//     LoadingIndicator loading = LoadingIndicator();
//     return SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: tealShade600,
//               title: const Text(
//                 "Add Product",
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
//               ),
//               actions: [
//                 sellController.isLoading
//                     ? loading.loadingIndicator()
//                     : TextButton(
//                         onPressed: () async {
//                           sellController.isLoading = true;
//                           await sellController.uploadProduct(
//                               context: context, image: sellController.image);
//                           Navigator.pop(context);
//                         },
//                         child: const Text(
//                           "Sell",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, color: whiteColor),
//                         ))
//               ],
//             ),
//             body: StreamBuilder(
//               stream: FirebaseServices.getsAllProducts(currentUser!.uid),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return loading.loadingIndicator();
//                 } else {
//                   var data = snapshot.data!.docs;
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               controller: sellController.productController,
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: whiteColor,
//                                   hintText: "Product Name",
//                                   label: const Text("Product Name"),
//                                   hintStyle:
//                                       const TextStyle(color: blackColor),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: blackColor, width: 2),
//                                       borderRadius: BorderRadius.circular(6)),
//                                   border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: whiteColor,
//                                       ),
//                                       borderRadius: BorderRadius.circular(6))),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               controller: sellController.descController,
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: whiteColor,
//                                   hintText: "Description",
//                                   label: const Text("Description"),
//                                   hintStyle:
//                                       const TextStyle(color: blackColor),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: blackColor, width: 2),
//                                       borderRadius: BorderRadius.circular(6)),
//                                   border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: whiteColor,
//                                       ),
//                                       borderRadius: BorderRadius.circular(6))),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               controller: sellController.priceController,
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: whiteColor,
//                                   hintText: "Price",
//                                   label: const Text("Price"),
//                                   hintStyle:
//                                       const TextStyle(color: blackColor),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: blackColor, width: 2),
//                                       borderRadius: BorderRadius.circular(6)),
//                                   border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: whiteColor,
//                                       ),
//                                       borderRadius: BorderRadius.circular(6))),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               controller: sellController.quantityController,
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: whiteColor,
//                                   hintText: "Quantity",
//                                   label: const Text("Quantity"),
//                                   hintStyle:
//                                       const TextStyle(color: blackColor),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: blackColor, width: 2),
//                                       borderRadius: BorderRadius.circular(6)),
//                                   border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: whiteColor,
//                                       ),
//                                       borderRadius: BorderRadius.circular(6))),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               controller: sellController.sellerNameController,
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: whiteColor,
//                                   hintText: "Seller Name",
//                                   label: const Text("Seller Name"),
//                                   hintStyle:
//                                       const TextStyle(color: blackColor),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: blackColor, width: 2),
//                                       borderRadius: BorderRadius.circular(6)),
//                                   border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: whiteColor,
//                                       ),
//                                       borderRadius: BorderRadius.circular(6))),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           DropDown(
//                             hint: 'Category',
//                             list: sellController.categoryList,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           DropDown(
//                             hint: 'SubCategory',
//                             list: sellController.subCategoryList,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Text(
//                             "Choose product image",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           const ImageScreen(),
//
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             )));
//   }
// }
