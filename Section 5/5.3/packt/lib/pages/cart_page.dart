import 'package:flutter/material.dart';
import 'package:packt/blocs/cart_bloc.dart';
import 'package:packt/models/product.dart';
import 'package:packt/widgets/bloc_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: _cartBloc.outProducts,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.data.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final product = snapshot.data[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: Text(product.amount.toString()),
                );
              },
            );
          } else {
            return Center(
              child: Text('No items in the cart'),
            );
          }
        },
      ),
    );
  }
}
