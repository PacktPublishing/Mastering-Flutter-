import 'package:flutter/material.dart';
import 'package:packt/blocs/categories_bloc.dart';
import 'package:packt/blocs/products_bloc.dart';
import 'package:packt/models/category.dart';
import 'package:packt/pages/selected_category_page.dart';
import 'package:packt/widgets/bloc_provider.dart';
import 'package:packt/widgets/cart_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoriesBloc _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
        actions: <Widget>[
          CartButton(),
        ],
      ),
      body: StreamBuilder(
        stream: _categoriesBloc.outCategories,
        builder: (BuildContext context, AsyncSnapshot<List<Category>> categories) {
          if (categories.hasData) {
            return ListView.builder(
              itemCount: categories.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () =>
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                          BlocProvider<ProductsBloc>(
                            bloc: ProductsBloc(categories.data[index]),
                            child: SelectedCategoryPage(),
                          ),
                      ),
                    ),
                  title: Text(
                    categories.data[index].name,
                    style: TextStyle(fontSize: 24.0),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}