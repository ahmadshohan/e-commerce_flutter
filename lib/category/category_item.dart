import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashinshop/home/products_grid.dart';
import 'package:fashinshop/provider/products.dart';

class CategoryItem extends StatelessWidget {
  static const routeName = '/category_Item';
  @override
  Widget build(BuildContext context) {
    final categoryPage = ModalRoute.of(context).settings.arguments as String;
    final productsData = Provider.of<Products>(context).productsList;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(
          categoryPage,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ProductsGrid(),
    );
  }
}
