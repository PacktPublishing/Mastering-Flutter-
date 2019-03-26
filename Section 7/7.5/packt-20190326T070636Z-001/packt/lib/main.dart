import 'package:flutter/material.dart';
import 'package:packt/blocs/cart_bloc.dart';
import 'package:packt/blocs/categories_bloc.dart';
import 'package:packt/pages/home_page.dart';
import 'package:packt/widgets/bloc_provider.dart';

void main() =>
  runApp(
    BlocProvider<CartBloc>(
      child: MyApp(),
      bloc: CartBloc(),
    )
  );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: BlocProvider<CategoriesBloc>(
        bloc: CategoriesBloc(),
        child: HomePage(),
      ),
    );
  }
}
