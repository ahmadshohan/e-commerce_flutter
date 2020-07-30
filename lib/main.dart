import 'package:flutter/material.dart';
import 'package:fashinshop/about_us.dart';
import 'package:provider/provider.dart';
import './category/category_item.dart';
import 'home/home_page.dart';
import 'shopping_cart/shopping_cart_page.dart';
import 'product_detail/product_details_page.dart';
import './provider/products.dart';
import 'splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: SplashPage(),
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          HomePage.routeName: (ctx) => HomePage(),
          ShoppingCart.routeName: (ctx) => ShoppingCart(),
          CategorySelected.routeName: (ctx) => CategorySelected(),
          AboutUs.routeName: (ctx) => AboutUs(),
        },
      ),
    );
  }
}
