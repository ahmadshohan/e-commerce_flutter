import 'package:fashinshop/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../provider/login_social.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../shopping_cart/shopping_cart_page.dart';
import '../drawer/favorites_page.dart';
import '../category/category_horizontal_list.dart';
import 'products_grid.dart';
import '../drawer/shop_drawer.dart';
import '../drawer/all_products.dart';
import '../shopping_cart/badge.dart';

enum PopFilterOption { Favorites, All, Logout }

class HomePage extends StatefulWidget {
  static const routeName = '/main-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loginSocial = Provider.of<LoginSocial>(context);
    final products = productsData.productsList;
    Widget imageCarousel = Container(
      height: 300,
      width: double.infinity,
      child: Carousel(
        images: [
          Image.asset(
            'images/products/dress/dr3.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/dress/dr1.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/dress/dr7.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/sets/set1.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/dress/dr8.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/tops/tops1.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/tops/tops13.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/tops/tops11.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/skirts/sk5.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/skirts/sk1.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/products/skirts/sk3.jpeg',
            fit: BoxFit.cover,
          ),
        ],
        autoplay: true,
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotColor: Colors.grey,
        boxFit: BoxFit.fitHeight,
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
          Consumer<Products>(
            builder: (_, productCart, ch) => Badge(
              child: ch,
              value: productCart.itemCount.toString(),
            ),
            child: IconButton(
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
          ),
          PopupMenuButton(
            onSelected: (PopFilterOption selectedValue) {
              setState(() {
                if (selectedValue == PopFilterOption.Favorites) {
                  Navigator.pushNamed(
                    context,
                    FavoritesPage.routeName,
                  );
                } else if (selectedValue == PopFilterOption.All) {
                  Navigator.pushNamed(
                    context,
                    AllProducts.routeName,
                  );
                } else {
                  loginSocial.signOutEmailPassword();
                  loginSocial.handleGoogleSignOut();
                  loginSocial.handleFacebookSignOut();
//                  Navigator.pop(context, false);
                  Navigator.pushReplacementNamed(
                    context,
                    WelcomePage.routeName,
                  );
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: PopFilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: PopFilterOption.All,
              ),
              PopupMenuItem(
                child: Text('Log out'),
                value: PopFilterOption.Logout,
              )
            ],
          )
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
            height: 500,
            child: ProductsGrid(
              products,
            ),
          ),
        ],
      ),
    );
  }
}
