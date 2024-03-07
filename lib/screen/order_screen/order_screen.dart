import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/screen/order_screen/order_details.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingIndicator loading = LoadingIndicator();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: transparentColor,
        title: const Text(
          "My Orders",
          style:
          TextStyle(color: black87Color, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream:FirebaseServices.getAllOrders(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loading.loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No orders yet!",
                style: TextStyle(color: black87Color),
              ),
            );
          } else {
            var data=snapshot.data!.docs;
            return ListView.builder(itemCount: data.length,itemBuilder: (BuildContext context,int index) {
              return ListTile(
                leading: Text("${index + 1}",style: const TextStyle(color: black87Color,fontWeight: FontWeight.bold),),
                title:Text(data[index]['order_code'].toString(),style:  TextStyle(color: tealShade600,fontWeight: FontWeight.w400),) ,
                subtitle:Text(data[index]['total_amount'].toString(),style:  const TextStyle(color: black87Color,fontWeight: FontWeight.bold),) ,
                trailing: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  OrdersDetails(data: data[index],),));
                }, icon: const Icon(Icons.arrow_forward_ios_rounded,color:black87Color,)),

              );
            },);
          }
        },),);
  }
}
