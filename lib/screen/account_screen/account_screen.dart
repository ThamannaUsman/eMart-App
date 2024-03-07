import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screen/account_screen/details_button.dart';
import 'package:ecommerce_app/screen/account_screen/edit_profile_screen.dart';
import 'package:ecommerce_app/screen/auth_screen/login_screen.dart';
import 'package:ecommerce_app/screen/order_screen/order_screen.dart';
import 'package:ecommerce_app/screen/wishlist_screen/wishlist_screen.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final authController =Provider.of<AuthController>(context);

    LoadingIndicator loading = LoadingIndicator();
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseServices.getUser(currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return loading.loadingIndicator();
        } else {
          var data = snapshot.data!.docs[0];
          return SafeArea(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: background2Gradient)),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(
                                    data: data,
                                  ),
                                ));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: whiteColor,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      data['imageUrl'] == ''
                          ? Container(
                              child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                "https://as2.ftcdn.net/v2/jpg/03/60/56/45/1000_F_360564599_mWtUO5Sm6VHSSl0dD6I99P2b11RIOrn0.jpg",
                              ),
                            ))
                          : Container(
                              child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(data['imageUrl']),
                            )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['name']}",
                            style: const TextStyle(
                                color: whiteColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data['email']}",
                            style: const TextStyle(
                              color: whiteColor,
                            ),
                          ),
                        ],
                      )),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: whiteColor)),
                        onPressed: () async {
                          await authController.signOut(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Log out",
                          style: TextStyle(
                              color: whiteColor, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                FutureBuilder(
                  future: FirebaseServices.getCounts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: loading.loadingIndicator(),
                      );
                    } else {
                      var countData=snapshot.data;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DetailsButton(
                              title: "in your cart", count: countData[0].toString()),
                          DetailsButton(
                              title: "in your wishlist",
                              count: countData[1].toString()),
                          DetailsButton(
                              title: "your orders", count: countData[2].toString()),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor,
                    ),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OrderScreen(),
                                      ));
                                  break;
                                case 1:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const WishListScreen(),
                                      ));
                                  break;
                              }
                            },
                            leading: Icon(
                              profileButtonIcon[index],
                              size: 22,
                            ),
                            title: Text(
                              profileButtonList[index],
                              style: const TextStyle(
                                  color: black87Color,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: greyColor,
                          );
                        },
                        itemCount: profileButtonList.length),
                  ),
                ),

              ],
            ),
          ));
        }
      },
    ));
  }
}
