import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../provider/products.dart';
import '../home/products_grid.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favorite-page';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).favoritesProducts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: TyperAnimatedTextKit(
          text: ['My Favourites'],
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
      body: productsData.isEmpty
          ? Center(
              child: Text(
                'No favorites yet please add an favorites',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ProductsGrid(productsData),
    );
  }
}
