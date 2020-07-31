import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../home/home_page.dart';

import 'product_cart.dart';

class ShoppingCart extends StatefulWidget {
  static const routeName = 'shopping-cart';
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Shopping Cart'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cart.cartItems.length,
          itemBuilder: (ctx, index) => SingleProductCart(
            id: cart.cartItems.values.toList()[index].id,
            title: cart.cartItems.values.toList()[index].title,
            image: cart.cartItems.values.toList()[index].image,
            price: cart.cartItems.values.toList()[index].price,
            quantity: cart.cartItems.values.toList()[index].quantity,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: <Widget>[
              Text(
                'Total :',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Chip(
                label: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${cart.totalAmount} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text: 'LL',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    )
                  ]),
                ),
              ),
              Spacer(),
              MaterialButton(
                elevation: 10,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  'ORDER NOW',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
