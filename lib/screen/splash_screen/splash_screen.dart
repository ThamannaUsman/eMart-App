import 'package:ecommerce_app/const_final/color.dart';
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
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigation()));
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
    return Scaffold(
      backgroundColor:tealShade900,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius:75,backgroundImage: AssetImage("assets/eMart.png"),),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
