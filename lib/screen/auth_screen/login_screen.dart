import 'package:ecommerce_app/const_final/color.dart';
import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screen/auth_screen/forgot_password.dart';
import 'package:ecommerce_app/screen/auth_screen/sign_up_screen.dart';
import 'package:ecommerce_app/screen/bottom_navigation_screen/bottom_navigation.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  Utils utils=Utils();
 bool isLoading=false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController =Provider.of<AuthController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: backgroundGradient),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius:45,backgroundImage: AssetImage("assets/eMart.png"),),
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
                    hintStyle: const TextStyle(color:blackColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: blackColor, width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                          color: blackColor,
                        ))),
                obscureText: obscureText,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context) => const ForgotPasswordScreen(),));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: lightBlueAccentColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                width: 300,
                child:isLoading? const CircularProgressIndicator(color: whiteColor,) :ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(tealShade400)),
                    onPressed: () async{
                      isLoading=true;
                      await authController.loginIn(context: context,email: emailController.text,password: passwordController.text).then((value) {
                        if(value != null){
                          utils.showSnackBar(context: context, content: "Logged in Successfully");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const BottomNavigation()));
                        }else{
                          isLoading=false;
                        }
                      });
                    },
                    child: const Text("LOGIN",style: TextStyle(color: whiteColor),))),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'create a new account',
              style: TextStyle(color: blackColor, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(tealShade200)),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                    },
                    child: const Text("Sign Up",style: TextStyle(color: whiteColor),))),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
