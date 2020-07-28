import 'package:flutter/material.dart';
import './services/login.dart';
import 'package:fashinshop/auth/auth_page.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'shopping_cart/shopping_cart_page.dart';
import 'product_detail/product_details_page.dart';
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
      create: (ctx) => Login(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SplashPage();
              }
              if (snapshot.hasData) {
                return HomePage();
              }
              return AuthPage();
            }),
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          HomePage.routeName: (ctx) => HomePage(),
          ShoppingCart.routeName: (ctx) => ShoppingCart()
        },
      ),
    );
  }
}
