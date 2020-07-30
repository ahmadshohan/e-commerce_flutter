import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fashinshop/provider/products.dart';
import 'package:provider/provider.dart';
import '../shopping_cart/shopping_cart_page.dart';
import '../category/category_horizontal_list.dart';
import 'products_grid.dart';
import 'shop_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/main-page';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).productsList;
    Widget imageCarousel = Container(
      height: 250,
      width: double.infinity,
      child: Carousel(
        images: [
          Image.asset(
            'images/products/dress/dr3.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/dress/dr1.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/dress/dr7.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/sets/set1.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/dress/dr8.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/tops/tops1.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/tops/tops13.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/tops/tops11.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/skirts/sk5.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/skirts/sk1.jpeg',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/products/skirts/sk3.jpeg',
            fit: BoxFit.fill,
          ),
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
          title: TyperAnimatedTextKit(
            text: ['Style ecorner'],
            speed: Duration(seconds: 1),
            isRepeatingAnimation: true,
            textStyle: TextStyle(
              color: Theme.of(context).accentTextTheme.title.color,
              fontSize: 25,
              fontFamily: 'Anton',
              fontWeight: FontWeight.normal,
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
            CategoryHorizentalList(),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8, bottom: 5),
              child: Text('Recent Products'),
            ),
            Container(
              height: 320,
              child: ProductsGrid(productsData),
            ),
          ],
        ));
  }
}
