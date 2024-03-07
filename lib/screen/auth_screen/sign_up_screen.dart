import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screen/auth_screen/login_screen.dart';
import 'package:ecommerce_app/screen/bottom_navigation_screen/bottom_navigation.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool obscureText = true;
  bool? isCheck = false;
  Utils utils = Utils();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: backgroundGradient),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("assets/eMart.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Log in to eMart",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: whiteColor, fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Name",
                    hintStyle: const TextStyle(color: blackColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: blackColor, width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: whiteColor,
                        ),
                        borderRadius: BorderRadius.circular(6))),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "E-Mail",
                    hintStyle: const TextStyle(color: blackColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: blackColor, width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: whiteColor,
                        ),
                        borderRadius: BorderRadius.circular(6))),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  hintText: "Password",
                  hintStyle: const TextStyle(color: blackColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: blackColor, width: 2),
                      borderRadius: BorderRadius.circular(6)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: whiteColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                obscureText: obscureText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: obscureText,
                controller: confirmController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(color: blackColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: blackColor, width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: whiteColor,
                        ),
                        borderRadius: BorderRadius.circular(6))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: tealShade600,
                    checkColor: Colors.white,
                    value: isCheck,
                    onChanged: (newValue) {
                      setState(() {
                        isCheck = newValue;
                      });
                    }),
                Expanded(
                  child: RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "I agree to the",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: blueGreyColor)),
                    TextSpan(
                        text: " Terms and Condition",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: tealShade400)),
                    const TextSpan(
                        text: " & ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: blueGreyColor)),
                    TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: tealShade400)),
                  ])),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300,
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: whiteColor,
                      )
                    : ElevatedButton(
                        style: isCheck == true
                            ? ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(tealShade300))
                            : ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(greyColor)),
                        onPressed: () async {
                          if (isCheck != false) {
                            isLoading = true;
                            try {
                              await authController
                                  .signUp(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) => authController.storeUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text))
                                  .then((value) {
                                utils.showSnackBar(
                                    context: context,
                                    content: "Logged in Successfully");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomNavigation()));
                              });
                            } catch (e) {
                              utils.showSnackBar(
                                  context: context, content: "Error Occured");
                              isLoading = false;
                            }
                          }
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(color: whiteColor)))),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text.rich(TextSpan(
                    text: "Already have an Account? ",
                    style: TextStyle(color: whiteColor),
                    children: [
                      TextSpan(
                          text: "Login",
                          style: TextStyle(color: greenAccentColor))
                    ])))
          ],
        ),
      ),
    );
  }
}
