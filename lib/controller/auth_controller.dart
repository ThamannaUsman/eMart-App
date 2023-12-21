import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthController extends ChangeNotifier {
  Future<UserCredential?> loginIn({email, password, context}) async {
    UserCredential? userCredential;
    // String output="something wrong went";
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
      'cart_count': '00',
      'wishlist_count': '00',
      'order_count': '00',
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
}
