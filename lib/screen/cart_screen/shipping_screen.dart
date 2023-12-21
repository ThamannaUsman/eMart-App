import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/screen/cart_screen/payment_method.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController=Provider.of<CartController>(context);
    return SafeArea(
      child: Scaffold(
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
                    if (cartController.addressController.text.length > 10) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentMethods(),));
                    }else
                    {
                      Utils().showSnackBar(context: context, content: "Please fill the form");
                    }
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  )),
            )),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Shopping Info",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cartController.nameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "Name",
                      hintStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cartController.addressController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "Address",
                      hintStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cartController.cityController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "City",
                      hintStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cartController.stateController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "State",
                      hintStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cartController.postalCodeController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "Postal Code",
                      hintStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cartController.phoneController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "Phone",
                      hintStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
