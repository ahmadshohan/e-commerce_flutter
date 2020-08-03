import 'package:fashinshop/drawer/all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../shopping_cart/badge.dart';
import '../home/home_page.dart';
import '../shopping_cart/shopping_cart_page.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Consumer<Products>(
            builder: (_, productCart, ch) => Badge(
              child: ch,
              value: productCart.itemCount.toString(),
            ),
            child: IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                ShoppingCart.routeName,
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
        ],
      ),
      body: productsData.isEmpty
          ? Center(
              child: Text(
                'No favorites yet please add an favorites',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )
          : ProductsGrid(productsData),
      floatingActionButton: productsData.isEmpty
          ? FloatingActionButton(
              child: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AllProducts.routeName);
              },
            )
          : null,
    );
  }
}
