import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  double _totalP = 0;

  get totalP => _totalP;

  set totalP(value) {
    _totalP = value;
    notifyListeners();
  }

  var _paymentIndex = 0;

  get paymentIndex => _paymentIndex;

  set paymentIndex(value) {
    _paymentIndex = value;
    notifyListeners();
  }
  var nameController=TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalCodeController = TextEditingController();
  var phoneController = TextEditingController();

  late dynamic productSnapshot;
  var _product = [];

  get product => _product;

  set product(value) {
    _product = value;
  }

  bool _placingOrder = false;

  bool get placingOrder => _placingOrder;

  set placingOrder(bool value) {
    _placingOrder = value;
    notifyListeners();
  }

  calculate(data) {
    _totalP = 0;
    for (var i = 0; i < data.length; i++) {
      _totalP = _totalP + double.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    _paymentIndex = index;
    notifyListeners();
  }

  playMyOrder(
      {required orderPaymentMethod, required totalAmount, context}) async {
    _placingOrder = true;
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': "233981237",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': nameController.text,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'order_by_postalcode': postalCodeController.text,
      'shipping_method': "Home Delivery",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(_product),
    });
    _placingOrder = false;
    notifyListeners();
  }

  getProductDetails() {
    _product.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      _product.add({
        'color': productSnapshot[i]['color'],
        'img': productSnapshot[i]['img'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'tprice': productSnapshot[i]['tprice'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title'],
      });
    }
    notifyListeners();
  }

  clearCart() {
    for (var i = 0; i < productSnapshot.length; i++) {
      firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
    notifyListeners();
  }
}