import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const_final/firebase_const.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class SellController extends ChangeNotifier {
  final productController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final sellerNameController = TextEditingController();


  Uint8List? _image;

  Uint8List? get image => _image;

  set image(Uint8List? value) {
    _image = value;
    notifyListeners();
  }

  var _categoryList = <String>[];

  get categoryList => _categoryList;

  set categoryList(value) {
    _categoryList = value;
    notifyListeners();
  }

  var _subCategoryList = <String>[];

  get subCategoryList => _subCategoryList;

  set subCategoryList(value) {
    _subCategoryList = value;
    notifyListeners();
  }


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Category> _category = [];

  List<Category> get category => _category;

  set category(List<Category> value) {
    _category = value;
    notifyListeners();
  }


  var _categoryValue = '';

  get categoryValue => _categoryValue;

  set categoryValue(value) {
    _categoryValue = value;
    notifyListeners();
  }

  var _subCategoryValue = '';

  get subCategoryValue => _subCategoryValue;

  set subCategoryValue(value) {
    _subCategoryValue = value;
    notifyListeners();
  }

  var _selectedColorIndex = 0;

  get selectedColorIndex => _selectedColorIndex;

  set selectedColorIndex(value) {
    _selectedColorIndex = value;
    notifyListeners();
  }


  getCategories() async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
    notifyListeners();
  }

  populateCategoryList() {
    _categoryList.clear();
    for (var item in category) {
      _categoryList.add(item.name);
    }
    notifyListeners();
  }

  populateSubCategory(cat) {
    _subCategoryList.clear();
    var data = category.where((element) => element.name == cat).toList();
    for (var i = 0; i < data.first.subcategory.length; i++) {
      _subCategoryList.add(data.first.subcategory[i]);

    }

    notifyListeners();
  }


  Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
    FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    return task.ref.getDownloadURL();
  }


  uploadProduct({context,Uint8List? image}) async {
    String uid =getUid();
    String url=await uploadImageToDatabase(image: image!,uid:uid);
    var store = firestore.collection(productCollection).doc();
    await store.set({
      'is_featured': false,
      'p_category': _categoryValue,
      'p_colors': FieldValue.arrayUnion([Colors.red.value,Colors.brown.value,Colors.pink.value]),
      'p_desc': descController.text,
      'p_imgs': url,
      'vendor_id': currentUser!.uid,
      'p_name': productController.text,
      'p_price': priceController.text,
      'p_quantity': quantityController.text,
      'p_rating': 5,
      'p_wishlist': FieldValue.arrayUnion([]),
      'p_seller': sellerNameController.text,
      'p_subcategory': _subCategoryValue,
    }, SetOptions(merge: true));
    isLoading = false;
    Utils().showSnackBar(context: context, content: "Product uploaded");
  }

addFeatured(docId) async{
    await firestore.collection(productCollection).doc(docId).set({
      'is_featured':true
    },SetOptions(merge: true));
}
  removeFeatured(docId) async{
    await firestore.collection(productCollection).doc(docId).set({
      'is_featured':false
    },SetOptions(merge: true));
  }
  removeProduct(docId) async{
    await firestore.collection(productCollection).doc(docId).delete();
  }
  Future<Uint8List?> pickImage() async{
    ImagePicker picker=ImagePicker();
    XFile? file= await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
    return file!.readAsBytes();
  }
  String getUid(){
    return (100000+Random().nextInt(10000)).toString();
  }

}
