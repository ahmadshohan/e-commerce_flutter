import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../product_detail/product_details_page.dart';

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Card(
      elevation: 2,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            ProductDetails.routeName,
            arguments: {
              'id': product.id,
              'name': product.name,
              'decription': product.descreption,
              'image': product.image,
              'currentPrice': product.currentPrice,
              'oldPrice': product.oldPrice,
            },
          ),
          child: GridTile(
            footer: Container(
              height: 50,
              color: Colors.black26,
              child: Row(children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
//                Expanded(
//                  child: Text(
//                    "${product.currentPrice}\$",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontWeight: FontWeight.w800,
//                        fontSize: 14),
//                  ),
//                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        product.toggleFavoriteStatus();
                      },
                      icon: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        size: 28,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ]),
            ),
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
