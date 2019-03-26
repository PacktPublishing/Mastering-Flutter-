import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:packt/api/db_api.dart';
import 'package:packt/models/category.dart';
import 'package:packt/models/product.dart';
import 'package:packt/widgets/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  List<Product> _products = List();

  final _productsController = StreamController<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  ProductsBloc(Category category) {
    getProducts(category);
  }

  void getProducts(Category category) {
    DbApi dbApi = DbApi();
    dbApi.getProducts(category).listen((snapshot){
      List<Product> tempProducts = List();
      for(DocumentSnapshot doc in snapshot.documents){
        Product product = Product.fromFirestore(doc.data);
        product.id = doc.documentID;
        tempProducts.add(product);
      }
      _products.clear();
      _products.addAll(tempProducts);
      _inProducts.add(_products);
    });
  }

  @override
  void dispose() {
    _productsController.close();
  }

}