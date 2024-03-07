// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/const_final/color.dart';
// import 'package:ecommerce_app/const_final/const.dart';
// import 'package:ecommerce_app/const_final/firebase_const.dart';
// import 'package:ecommerce_app/controller/sell_controller.dart';
// import 'package:ecommerce_app/screen/admin_panel/admin_panel.dart';
// import 'package:ecommerce_app/screen/category_screen/item_details.dart';
// import 'package:ecommerce_app/services/firebase_services.dart';
// import 'package:ecommerce_app/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class ScreenProduct extends StatelessWidget {
//   const ScreenProduct({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final sellController = Provider.of<SellController>(context);
//     LoadingIndicator loading = LoadingIndicator();
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: greyShade200,
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: tealShade600,
//           foregroundColor: whiteColor,
//           shape:const CircleBorder(),
//           onPressed: () async {
//             await sellController.getCategories();
//             sellController.populateCategoryList();
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SellScreen(),
//                 ));
//           },
//           child: const Icon(Icons.add),
//         ),
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: transparentColor,
//           title: const Text(
//             "Products",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: StreamBuilder(
//           stream: FirebaseServices.getsAllProducts(currentUser!.uid),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return loading.loadingIndicator();
//             } else {
//               var data = snapshot.data!.docs;
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     children: List.generate(data.length, (index) {
//                       return Card(
//                         color:whiteColor,
//                         child: ListTile(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(
//                               builder: (context) {
//                                 return ItemDetails(
//                                   title: "${data[index]['p_name']}",
//                                   data: data[index],
//                                 );
//                               },
//                             ));
//                           },
//                           leading: Image.network(
//                             data[index]['p_imgs'],
//                             width: 100,
//                             height: 100,
//                           ),
//                           title: Text(
//                             "${data[index]['p_name']}",
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Row(
//                             children: [
//                               Text(
//                                  '\₹'+"${data[index]['p_price']}",
//                               ),
//                               Text(
//                                 data[index]['is_featured'] == true
//                                     ? "  Featured"
//                                     : '',
//                                 style: const TextStyle(
//                                     color: greenColor,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           trailing: PopupMenuButton(
//                             itemBuilder: (context) => [
//                               PopupMenuItem(
//                                 onTap: () {
//                                   if(data[index]['is_featured'] == true){
//                                     sellController.removeFeatured(data[index].id);
//                                     Utils().showSnackBar(context: context, content: "Removed Featured");
//                                   }else{
//                                     sellController.addFeatured(data[index].id);
//                                     Utils().showSnackBar(context: context, content: "Added Featured");
//                                   }
//                                 },
//                                 child: const Text('Featured'),
//                               ),
//                               PopupMenuItem(
//                                 onTap: () {
//                                     sellController.removeProduct(data[index].id);
//                                     Utils().showSnackBar(context: context, content: "Removed Product");
//                                 },
//                                 child: const Text('Delete'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
