import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'provider/login_social.dart';
import 'package:fashinshop/drawer/rate_us.dart';
import 'package:fashinshop/taps_page.dart';
import './auth/auth_page.dart';
import 'drawer/about_us.dart';
import 'welcome_page.dart';
import './category/category_item.dart';
import 'drawer/favorites_page.dart';
import './drawer/orders/orders_page.dart';
import 'home/home_page.dart';
import 'shopping_cart/shopping_cart_page.dart';
import 'product_detail/product_details_page.dart';
import 'drawer/all_products.dart';
import './provider/products.dart';
import './provider/orders.dart';
import 'splash_page.dart';

FirebaseAnalytics analytics = FirebaseAnalytics();
bool USE_FIRESTORE_EMULATOR = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = Settings(
        host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff0a1617),
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LoginSocial(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
//        ChangeNotifierProxyProvider<LoginSocial, Orders>(
//          update: (ctx, loginSocial, privusOrder) => Orders(loginSocial.userId,
//              privusOrder == null ? [] : privusOrder.orders),
//        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: SplashPage(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          TapsPage.routeName: (ctx) => TapsPage(),
          HomePage.routeName: (ctx) => HomePage(),
          RateUs.routeName: (ctx) => RateUs(),
          AuthPage.routeName: (ctx) => AuthPage(),
          WelcomePage.routeName: (ctx) => WelcomePage(),
          OrdersPage.routeName: (ctx) => OrdersPage(),
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
