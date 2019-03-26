import 'package:flutter/material.dart';
import 'package:packt/api/db_api.dart';

class HomePage extends StatelessWidget {
  final DbApi dbApi = DbApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
      ),
      body: ListView.builder(
        itemCount: dbApi.getCategories().length,
        itemBuilder: (BuildContext context, int index){
          return Text(dbApi.getCategories()[index].name);
        }
      ),
    );
  }
}
