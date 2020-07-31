import 'package:flutter/material.dart';
import './auth/auth_page.dart';
import 'package:provider/provider.dart';
import 'drawer/about_us.dart';
import 'welcome_page.dart';
import './category/category_item.dart';
import 'drawer/favorites_page.dart';
import 'home/home_page.dart';
import 'shopping_cart/shopping_cart_page.dart';
import 'product_detail/product_details_page.dart';
import 'drawer/all_products.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
      ],
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
          AuthPage.routeName: (ctx) => AuthPage(),
          WelcomePage.routeName: (ctx) => WelcomePage(),
          ShoppingCart.routeName: (ctx) => ShoppingCart(),
          CategorySelected.routeName: (ctx) => CategorySelected(),
          AboutUs.routeName: (ctx) => AboutUs(),
          FavoritesPage.routeName: (ctx) => FavoritesPage(),
          AllProducts.routeName: (ctx) => AllProducts(),
        },
      ),
    );
  }
}
