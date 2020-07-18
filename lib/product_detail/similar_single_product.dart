import 'package:flutter/material.dart';
import 'product_details_page.dart';

class SimilarSingleProduct extends StatelessWidget {
  final String name, image;
  final int oldPrice, currentPrice;
  SimilarSingleProduct(
      {this.name, this.image, this.oldPrice, this.currentPrice});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Hero(
        tag: name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: {
                  'name': name,
                  'image': image,
                  'oldPrice': oldPrice,
                  'currentPrice': currentPrice
                }),
            child: GridTile(
              footer: Container(
                height: 50,
                color: Colors.white70,
                child: Row(children: <Widget>[
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$currentPrice\$",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                        Text(
                          "$oldPrice\$",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
