import 'package:packt/models/category.dart';
import 'package:packt/models/product.dart';

class DbApi{
  List<Category> getCategories(){
    List<Category> tempList = [ Category(), Category(), Category(), Category()];
    return tempList;
  }

  List<Product> getProducts(Category category){
    List<Product> tempList = [ Product.create('product'), Product.create('product'), Product.create('product')];
    return tempList;
  }
}