import 'package:flutter/material.dart';
import 'package:packt/blocs/cart_bloc.dart';
import 'package:packt/pages/cart_page.dart';
import 'package:packt/widgets/bloc_provider.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => CartPage(),
              ),
            );
          },
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: StreamBuilder<int>(
              stream: _cartBloc.outCount,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 12.0),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
