import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingIndicator loading = LoadingIndicator();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Wishlist",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseServices.getWishlists(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loading.loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No wishlist yet!",
                style: TextStyle(color: Colors.black87),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context,int index) {
                      return ListTile(
                        leading: Image.network(
                          "${data[index]['p_imgs']}",
                          width: 80,
                        ),
                        title: Text(
                          "${data[index]['p_name']}",
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${data[index]['p_price']}",
                          style: TextStyle(
                              color: Colors.teal.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                            onPressed: () async{
                          await firestore.collection(productCollection).doc(data[index].id).set({
                           'p_wishlist' : FieldValue.arrayRemove([currentUser!.uid])
                          },SetOptions(merge: true));
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
