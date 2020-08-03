import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shopping_cart/badge.dart';
import '../shopping_cart/shopping_cart_page.dart';
import '../home/home_page.dart';
import '../home/products_grid.dart';
import '../provider/products.dart';

class CategorySelected extends StatelessWidget {
  static const routeName = '/category_Item';
  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context).settings.arguments as String;
    final productsData = Provider.of<Products>(context).productsList;
    final productsFilterd = productsData.where((product) {
      return product.category.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(
          categoryId,
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
      body: ProductsGrid(productsFilterd),
    );
  }
}
