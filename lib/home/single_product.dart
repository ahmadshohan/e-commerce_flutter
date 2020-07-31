import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../provider/products.dart';
import '../product_detail/product_details_page.dart';

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<Product>(context);
    final product = Provider.of<Products>(context);

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
              'id': singleProduct.id,
              'name': singleProduct.name,
              'decription': singleProduct.descreption,
              'category': singleProduct.category,
              'image': singleProduct.image,
              'favorites': singleProduct.isFavorite,
              'currentPrice': singleProduct.currentPrice,
              'oldPrice': singleProduct.oldPrice,
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
                    singleProduct.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        singleProduct.toggleFavoriteStatus();
                      },
                      icon: Icon(
                        singleProduct.isFavorite
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
                      onPressed: () {
                        product.addCart(
                            singleProduct.id,
                            singleProduct.currentPrice,
                            singleProduct.image,
                            singleProduct.name);
                      },
                    )
                  ],
                ),
              ]),
            ),
            child: Image.asset(
              singleProduct.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
