import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends ChangeNotifier {
  var emailController=TextEditingController();
  Future<UserCredential?> loginIn({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Utils().showSnackBar(context: context, content: e.message.toString());
    }
    return userCredential;
  }

  Future<UserCredential?> signUp({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Utils().showSnackBar(context: context, content: e.message.toString());
    }
    return userCredential;

  }

  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id':currentUser!.uid,
    });
  }

  signOut(context) async {
    try {
      await auth.signOut();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Utils().showSnackBar(context: context, content: e.message.toString());
    }
  }
   passwordReset(context) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      Utils().showSnackBar(context: context, content: "Password reset link sent! Check your email");
      notifyListeners();
    }on FirebaseAuthException catch(e){
      Utils().showSnackBar(context: context, content: e.message.toString());
    }
  }
  Future<void> googleAuth() async {
    final GoogleSignIn googleSignIn=GoogleSignIn();
    final GoogleSignInAccount? googleUser=await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth=await googleUser!.authentication;
    final AuthCredential credential=GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
    );
    final UserCredential userCredential=await auth.signInWithCredential(credential);

  }
}
