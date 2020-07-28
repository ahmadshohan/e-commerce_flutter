import 'file:///C:/Users/ASUS/Desktop/e-commerce-app/fashin_shop/lib/shopping_cart/shopping_cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'category_horizontal_list.dart';
import 'products.dart';
import 'shop_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/main-page';
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 250,
      width: double.infinity,
      child: Carousel(
        images: [
          AssetImage('images/products/l1.jpeg'),
          AssetImage('images/products/l2.jpeg'),
          AssetImage('images/products/l3.jpeg'),
          AssetImage('images/products/l4.jpeg'),
          AssetImage('images/products/l5.jpeg'),
          AssetImage('images/products/l6.jpeg'),
          AssetImage('images/products/l7.jpeg'),
          AssetImage('images/products/l8.jpeg'),
          AssetImage('images/products/l9.jpeg'),
          AssetImage('images/products/l10.jpeg'),
          AssetImage('images/products/l11.jpeg'),
        ],
        autoplay: true,
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotColor: Colors.grey,
        boxFit: BoxFit.cover,
        dotSize: 7,
        dotPosition: DotPosition.bottomCenter,
        autoplayDuration: Duration(seconds: 4),
        dotIncreaseSize: 4,
        indicatorBgPadding: 7,
        dotSpacing: 20,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: Text(
            'Style ecorner',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
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
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                ShoppingCart.routeName,
              ),
            ),
          ],
        ),
        drawer: ShopDrawer(),
        body: ListView(
          children: <Widget>[
            imageCarousel,
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8, bottom: 5),
              child: Text(
                'Category',
                style: TextStyle(color: Colors.black),
              ),
            ),
            HorizentalList(),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8, bottom: 5),
              child: Text('Recent Products'),
            ),
            Container(
              height: 320,
              child: Products(),
            ),
          ],
        ));
  }
}
