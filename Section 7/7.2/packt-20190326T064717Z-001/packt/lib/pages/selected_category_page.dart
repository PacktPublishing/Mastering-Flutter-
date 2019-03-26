import 'package:flutter/material.dart';
import 'package:packt/blocs/cart_bloc.dart';
import 'package:packt/blocs/products_bloc.dart';
import 'package:packt/models/product.dart';
import 'package:packt/widgets/bloc_provider.dart';
import 'package:packt/widgets/cart_button.dart';

class SelectedCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productsBloc = BlocProvider.of<ProductsBloc>(context);
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          CartButton(),
        ],
      ),
      body: StreamBuilder<List<Product>>(
        stream: _productsBloc.outProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data[index];
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _cartBloc.addProduct(product),
                          child: Center(
                            child: Text(snapshot.data[index].name),
                          ),
                        ),
                      ),
                    ),
                  ],
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
