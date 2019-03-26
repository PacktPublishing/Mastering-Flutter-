import 'dart:async';

import 'package:packt/models/category.dart';
import 'package:packt/widgets/bloc_provider.dart';

class CategoriesBloc implements BlocBase{
  List<Category> _categories;

  StreamController<List<Category>> _categoriesController = StreamController<List<Category>>();
  Sink<List<Category>> get _inCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;




  @override
  void dispose() {
    _categoriesController.close();
  }

}