import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/services/firebase_services.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductController extends ChangeNotifier {
  var _quantity = 0;
  get quantity => _quantity;

  set quantity(value) {
    _quantity = value;
    notifyListeners();
  }

  dynamic _productMethod;

  dynamic get productMethod => _productMethod;

  set productMethod(dynamic value) {
    _productMethod = value;
    notifyListeners();
  }
  var _colorIndex = 0;

  get colorIndex => _colorIndex;

  set colorIndex(value) {
    _colorIndex = value;
    notifyListeners();
  }
  double _totalPrice = 0;

  get totalPrice => _totalPrice;

  set totalPrice(value) {
    _totalPrice = value;
    notifyListeners();
  }
  dynamic _subCat = [];

  dynamic  get subCat => _subCat;

  set subCat(value) {
    _subCat = value;
    notifyListeners();
  }

bool _isFav=false;

  bool get isFav => _isFav;

  set isFav(bool value) {
    _isFav = value;
    notifyListeners();
  }
  getSubCategories(title) async {
    _subCat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element) => element.name == title)
        .toList();

    for (var e in s[0].subcategory) {
      _subCat.add(e);

    }
    notifyListeners();
  }

  changeColorIndex(index) {
    _colorIndex = index;
    notifyListeners();
  }

  increaseQuantity(totalQuantity) {
    if (_quantity < totalQuantity) {
      _quantity++;
      notifyListeners();
    }
  }

  decreaseQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }

  calculateTotalPrice(price) {
    _totalPrice = price * _quantity;
    notifyListeners();
  }


  addToCart({title, img, sellername, color, qty, tprice, context,vendorId}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      'qty': qty,
      'vendor_id':vendorId,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error){
      Utils().showSnackBar(context: context, content: error.toString());
    });
    notifyListeners();
  }
  resetValues(){
    _totalPrice=0;
    _quantity=0;
    _colorIndex=0;
    notifyListeners();
  }
  addToWishList(docId,context) async{
    await firestore.collection(productCollection).doc(docId).set({
      'p_wishlist' : FieldValue.arrayUnion([currentUser!.uid])
    },SetOptions(merge: true));
    _isFav=true;
    notifyListeners();
    Utils().showSnackBar(context: context, content: "Added to wishlist");

  }
  removeFromWishList(docId,context) async{
    await firestore.collection(productCollection).doc(docId).set({
      'p_wishlist' : FieldValue.arrayRemove([currentUser!.uid])
    },SetOptions(merge: true));
    _isFav=false;
    notifyListeners();
    Utils().showSnackBar(context: context, content: "Removed from wishlist");
  }

  checkIfFav(data) async{
    if(data['p_wishlist'].contains(currentUser!.uid)){
      _isFav=true;
    }else{
      _isFav=false;
    }
    notifyListeners();
  }
  switchCategory(title) {
       if (_subCat.contains(title)) {
         _productMethod = FirebaseServices.subCategoryProducts(title);
         notifyListeners();
       } else {
         _productMethod = FirebaseServices.getProducts(title);
         notifyListeners();
       }

     }
}