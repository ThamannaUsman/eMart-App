// import 'package:ecommerce_app/controller/sell_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class DropDown extends StatelessWidget {
//   final String hint;
//  final List<String> list;
//   const DropDown({super.key, required this.hint, required this.list});
//
//   @override
//   Widget build(BuildContext context) {
//     return   Consumer<SellController>(
//       builder: (context, data, child) {
//         return  DropdownButtonFormField(hint:  Text(hint),items: list.map((e) =>
//             DropdownMenuItem(child: Text(e), value: e,))
//             .toList(), onChanged: (val){
//           if(hint == 'Category'){
//             data.subCategoryValue='';
//             data.populateSubCategory(val.toString());
//             data.categoryValue=val;
//           }
//           data.subCategoryValue=val;
//
//         });
//       },
//     );
//   }
// }
