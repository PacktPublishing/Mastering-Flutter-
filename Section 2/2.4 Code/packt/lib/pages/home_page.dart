import 'package:flutter/material.dart';
import 'package:packt/api/db_api.dart';
import 'package:packt/blocs/categories_bloc.dart';
import 'package:packt/widgets/bloc_provider.dart';

class HomePage extends StatelessWidget {
  final DbApi dbApi = DbApi();
  @override
  Widget build(BuildContext context) {
    final CategoriesBloc _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
      ),
      body: ListView.builder(
        itemCount: dbApi.getCategories().length,
        itemBuilder: (BuildContext context, int index){
          return Text(
            dbApi.getCategories()[index].name,
            style: TextStyle(fontSize: 24.0),
          );
        }
      ),
    );
  }
}