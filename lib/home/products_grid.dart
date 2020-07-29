import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'single_product.dart';
import '../provider/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).productsList;
    return GridView.builder(
        padding: EdgeInsets.only(bottom: 70, left: 10, right: 10, top: 5),
        itemCount: productsData.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return SingleProduct(
            name: productsData[i].name,
            descreption: productsData[i].descreption,
            image: productsData[i].image,
            oldPrice: productsData[i].oldPrice,
            currentPrice: productsData[i].currentPrice,
          );
        });
  }
}
