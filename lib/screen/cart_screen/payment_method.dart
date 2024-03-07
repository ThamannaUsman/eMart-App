import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/screen/bottom_navigation_screen/bottom_navigation.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController=Provider.of<CartController>(context);
    LoadingIndicator loading = LoadingIndicator();
    return SafeArea(
        child: Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
          width: 550,
          child:cartController.placingOrder ? Center(child: loading.loadingIndicator(),) : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(tealShade800),
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder())
                ),
                onPressed: () async{
                 await cartController.playMyOrder(
                    orderPaymentMethod: paymentMethodName[cartController.paymentIndex],
                    totalAmount: cartController.totalP,
                    context: context,
                  );
                 await cartController.clearCart();
                  Utils().showSnackBar(context: context, content: "Order placed Successfully");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),));
                },
                child: const Text(
                  "Place my order",
                  style: TextStyle(
                    color: whiteColor,
                  ),
                )),
          )),
      appBar: AppBar(
        backgroundColor: transparentColor,
        title: const Text(
          "Choose Payment Method",
          style: TextStyle(color: black87Color, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: List.generate(paymentMethodList.length, (index) {
          return GestureDetector(
            onTap: (){
              cartController.changePaymentIndex(index);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(

                      color:cartController.paymentIndex == index ? tealShade400 : transparentColor,
                      width: 4)),
              margin: const EdgeInsets.only(bottom: 8),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    paymentMethodList[index],
                    width: double.infinity,
                    height: 120,
                    colorBlendMode: cartController.paymentIndex == index ? BlendMode.darken : BlendMode.color,
                    color: cartController.paymentIndex == index ? Colors.black.withOpacity(0.4) : transparentColor,
                    fit: BoxFit.cover,
                  ),
                cartController.paymentIndex == index ?  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      activeColor: greenColor,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ): Container(),
                  Positioned(bottom: 10,right:10,child: Text(paymentMethodName[index], style: const TextStyle(color: whiteColor,fontSize: 16, fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          );
        })),
      ),
    ));
  }
}
