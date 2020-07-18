import 'package:flutter/material.dart';
import 'single_product.dart';
import '../components/data_lists.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.only(bottom: 70, left: 10, right: 10, top: 5),
        itemCount: productsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return SingleProduct(
            name: productsList[index]['name'],
            image: productsList[index]['image'],
            oldPrice: productsList[index]['oldPrice'],
            currentPrice: productsList[index]['currentPrice'],
          );
        });
  }
}
