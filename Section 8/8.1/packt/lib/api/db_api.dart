import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:packt/models/category.dart';
//import 'package:packt/models/product.dart';

class DbApi{
  /*List<Category> getCategories(){
    List<Category> tempList = [ Category(), Category(), Category(), Category()];
    return tempList;
  }*/

  /*List<Product> getProducts(Category category){
    List<Product> tempList = [ Product.create('product'), Product.create('product'), Product.create('product')];
    return tempList;
  }*/

  Stream<QuerySnapshot> getCategories(){
    Firestore db = Firestore.instance;
    try{
      Stream<QuerySnapshot> querySnapshot = db.collection('Categories').snapshots();
      return querySnapshot;
    }catch(e){
      print(e);
      throw e;
    }
  }

  Stream<QuerySnapshot> getProducts(Category category){
    Firestore db = Firestore.instance;
    try{
      Stream<QuerySnapshot> querySnapshot = db.collection('Categories').document(category.id).collection('parts').snapshots();
      return querySnapshot;
    }catch(e){
      print(e);
      throw e;
    }
  }


}