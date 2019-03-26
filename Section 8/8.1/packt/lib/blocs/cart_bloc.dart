import 'dart:async';

import 'package:packt/models/cart.dart';
import 'package:packt/models/product.dart';
import 'package:packt/widgets/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends BlocBase {
  Cart _cart = Cart();

  final _productsController = BehaviorSubject<List<Product>>();

  Sink<List<Product>> get _inProducts => _productsController.sink;

  Stream<List<Product>> get outProducts => _productsController.stream;

  final _countController = BehaviorSubject<int>();

  Sink<int> get _inCount => _countController.sink;

  Stream<int> get outCount => _countController.stream;

  @override
  void dispose() {
    _productsController.close();
    _countController.close();
  }

  void addProduct(Product product) {
    assert(product != null);
    final products = _cart.products;
    if (products.contains(product)) {
      products[products.indexOf(product)].amount++;
    } else {
      product.amount = 1;
      products.add(product);
    }

    _cart.itemCount++;
    _inCount.add(_cart.itemCount);
    _inProducts.add(products);
  }

}