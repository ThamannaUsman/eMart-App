import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/controller/profile_controller.dart';
import 'package:ecommerce_app/controller/sell_controller.dart';
import 'package:ecommerce_app/screen/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAiS9rS16VeDJEsLjCL03WSMr9EsOMv4rc",
            authDomain: "emart-544b1.firebaseapp.com",
            projectId: "emart-544b1",
            storageBucket: "emart-544b1.appspot.com",
            messagingSenderId: "308876570155",
            appId: "1:308876570155:web:a7a5a1e5d2cb6444df046e",
            measurementId: "G-R8SFRWXEX5"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider<ProfileController>(
          create: (context) => ProfileController(),
        ),
        ChangeNotifierProvider<ProductController>(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider<CartController>(
          create: (context) => CartController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider<SellController>(
          create: (context) => SellController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade600),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
