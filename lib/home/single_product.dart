import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            arguments: singleProduct.id,
          ),
          child: GridTile(
            footer: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(18),
                ),
              ),
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
                          singleProduct.name,
                        );
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added item to cart',
                              style: TextStyle(fontSize: 17),
                            ),
                            duration: Duration(
                              seconds: 3,
                            ),
                            elevation: 3,
                            action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                product.removeSingleItem(
                                  singleProduct.id,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ]),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  18,
                ),
              ),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('images/placeholder.png'),
                image: AssetImage(
                  singleProduct.image,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
