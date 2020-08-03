import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../drawer/orders/orders_page.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
//import 'package:url_launcher/url_launcher.dart';
import '../provider/cart_item.dart';
import '../components/constants.dart';
import '../provider/products.dart';
import '../home/home_page.dart';
import '../drawer/all_products.dart';
import '../provider/orders.dart';
import 'product_cart.dart';

class ShoppingCart extends StatefulWidget {
  static const routeName = 'shopping-cart';
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool _isLoading = false;
  bool isInit = true;
  Products cart;
  Map<String, CartItem> cartItems;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      cart = Provider.of<Products>(
        context,
      );
      cartItems = cart.cartItems;
      isInit = false;
    }
  }

  void handleOrderNow() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Orders>(context, listen: false).addOrder(
      cart.cartItems.values.toList(),
      cart.totalAmount,
    );
    cart.clear();
    setState(() {
      _isLoading = false;
    });
    await showSuccessDialog(context);
    Navigator.pushReplacementNamed(context, OrdersPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
      body: cartItems.isEmpty || cart.totalAmount == 0
          ? Center(
              child: Text(
                'Not found items in your cart please add products !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (ctx, index) => SingleProductCart(
                  cartId: cart.cartItems.values.toList()[index].id,
                  productId: cart.cartItems.keys.toList()[index],
                  title: cart.cartItems.values.toList()[index].title,
                  color: cart.cartItems.values.toList()[index].color,
                  size: cart.cartItems.values.toList()[index].size,
                  image: cart.cartItems.values.toList()[index].image,
                  price: cart.cartItems.values.toList()[index].price,
                  quantity: cart.cartItems.values.toList()[index].quantity,
                ),
              ),
            ),
      floatingActionButton: cartItems.isEmpty
          ? Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(
                right: 18,
                bottom: 15,
              ),
              child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AllProducts.routeName);
                },
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              color: Colors.white30,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Total :',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
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
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      elevation: 10,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: handleOrderNow,
//                      launchWhatsApp(phone: '963951541016', message: 'hello');
//                      FlutterOpenWhatsapp.sendSingleMessage(
//                      "95379823123",
//                      "Hello",
//                    );
                      textColor: Colors.white,
                      color: Colors.black,
                      child: _isLoading
                          ? kSpinkit
                          : Text(
                              'ORDER NOW',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
