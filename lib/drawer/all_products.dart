import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../provider/products.dart';
import '../home/products_grid.dart';

class AllProducts extends StatelessWidget {
  static const routeName = '/All-Products-page';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).productsList;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: TyperAnimatedTextKit(
          text: ['All Products'],
          speed: Duration(seconds: 1),
          isRepeatingAnimation: false,
          textStyle: TextStyle(
            color: Theme.of(context).accentTextTheme.title.color,
            fontSize: 25,
            fontFamily: 'Anton',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ProductsGrid(productsData),
    );
  }
}
