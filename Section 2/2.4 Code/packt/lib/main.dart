import 'package:flutter/material.dart';
import 'package:packt/blocs/categories_bloc.dart';
import 'package:packt/pages/home_page.dart';
import 'package:packt/widgets/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: CategoriesBloc(),
        child: HomePage(),
      ),
    );
  }
}
