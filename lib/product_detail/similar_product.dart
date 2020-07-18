import 'package:flutter/material.dart';
import 'similar_single_product.dart';
import '../components/data_lists.dart';

class SimilarProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.only(bottom: 70, left: 10, right: 10, top: 5),
        itemCount: similarProductsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return SimilarSingleProduct(
            name: similarProductsList[index]['name'],
            image: similarProductsList[index]['image'],
            oldPrice: similarProductsList[index]['oldPrice'],
            currentPrice: similarProductsList[index]['currentPrice'],
          );
        });
  }
}
