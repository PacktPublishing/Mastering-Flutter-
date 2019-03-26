import 'dart:async';

import 'package:packt/models/cart.dart';
import 'package:packt/models/product.dart';
import 'package:packt/widgets/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends BlocBase{
  Cart _cart = Cart();

  final _productsController = BehaviorSubject<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  @override
  void dispose() {
    _productsController.close();
  }

}