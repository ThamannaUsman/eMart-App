import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screen/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController=Provider.of<AuthController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Reset Password',
            style: TextStyle(
                fontSize: 38,
                color: Colors.teal.shade700,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Enter your email and we will send \nyou a password reset link',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Colors.teal.shade500,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: authController.emailController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  hintText: "E-Mail",
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
          SizedBox(
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal.shade400)),
                  onPressed: () async {
                    authController.passwordReset(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(color: whiteColor),
                  ))),
        ],
      ),
    );
  }
}
