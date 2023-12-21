import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/screen/auth_screen/login_screen.dart';
import 'package:ecommerce_app/screen/bottom_navigation_screen/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
    auth.authStateChanges().listen((User? user) {
      if(user == null && mounted){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        },));
      }else{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                const BottomNavigation()));
      }
    });
    });
  }
@override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 75,
                child: Image.network(
                  "https://imgs.search.brave.com/3wC_hOdTVk4JBzX2sOFtH2pSHAmfV8Pm622eWJae1YA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAxLzQxLzQwLzc2/LzM2MF9GXzE0MTQw/NzY4M19BbU91QnRJ/SDU5enZ5aTFUOXQw/WnFaYU15WUwwWUdG/WS5qcGc",
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "eMart",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 19, color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
