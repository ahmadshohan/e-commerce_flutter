import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashinshop/home/products_grid.dart';
import 'package:fashinshop/provider/products.dart';

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
      ),
      body: ProductsGrid(productsFilterd),
    );
  }
}
