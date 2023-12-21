import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/screen/cart_screen/shipping_screen.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingIndicator loading = LoadingIndicator();
    final cartController=Provider.of<CartController>(context);
    return Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: SizedBox(
            width: 550,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade800),
                      shape: MaterialStateProperty.all(const RoundedRectangleBorder())
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ShippingDetails(),));
                  },
                  child: const Text(
                    "Proceed to shipping",
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  )),
            )),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            "Shopping cart",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseServices.getCart(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loading.loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "Cart is empty",
                  style: TextStyle(color: Colors.black87),
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              cartController.calculate(data);
              cartController.productSnapshot=data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.network("${data[index]['img']}",width: 80,fit: BoxFit.cover,),
                          title: Text(
                            "${data[index]['title']}  (x${data[index]['qty']}) ",
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '\₹'+"${data[index]['tprice']}",
                            style: TextStyle(
                                color: Colors.teal.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                FirebaseServices.deleteDocument(data[index].id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        );
                      },
                    )),
                    Container(
                      color: Colors.amber.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Price",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\₹'+"${cartController.totalP}",
                              style: TextStyle(
                                  color: Colors.teal[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
