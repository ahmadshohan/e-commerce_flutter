import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'single_product.dart';
import '../provider/product.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  ProductsGrid(this.products);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.only(bottom: 70, left: 10, right: 10, top: 5),
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return ChangeNotifierProvider.value(
            value: products[i],
            child: SingleProduct(
//              name: productsData[i].name,
//              descreption: productsData[i].descreption,
//              image: productsData[i].image,
//              oldPrice: productsData[i].oldPrice,
//              currentPrice: productsData[i].currentPrice,
                ),
          );
        });
  }
}
