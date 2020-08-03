import 'package:fashinshop/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'about_us.dart';
import 'orders/orders_page.dart';
import '../shopping_cart/shopping_cart_page.dart';
import 'favorites_page.dart';
import '../home/home_page.dart';
import 'all_products.dart';

class ShopDrawer extends StatelessWidget {
  final firebaseAuth = FirebaseAuth.instance;

//  final fireStore = Firestore.instance;
//  final GoogleSignIn googleSignIn = GoogleSignIn(
//    scopes: [
//      'email',
//      'https://www.googleapis.com/auth/contacts.readonly',
//    ],
//  );
//
//  Future<void> handleGoogleSignOut() async {
//    await firebaseAuth.signOut().then((value) {
//      googleSignIn.signOut();
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Style-ecorner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: Text('Online boutique'),
            currentAccountPicture: GestureDetector(
              onTap: () {},
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('images/logo.jpeg')),
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, HomePage.routeName),
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
          ),
//          InkWell(
//            onTap: () {},
//            child: ListTile(
//              title: Text('My account'),
//              leading: Icon(
//                Icons.person,
//                color: Colors.red,
//              ),
//            ),
//          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, OrdersPage.routeName);
            },
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                ShoppingCart.routeName,
              );
            },
            child: ListTile(
              title: Text('Shopping cart'),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AllProducts.routeName);
            },
            child: ListTile(
              title: Text('All Products'),
              leading: Icon(
                Icons.border_all,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(FavoritesPage.routeName);
            },
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AboutUs.routeName);
            },
            child: ListTile(
              title: Text('About us'),
              leading: Icon(
                Icons.help,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              firebaseAuth.signOut();
              Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
            },
            child: ListTile(
              title: Text('Log out'),
              leading: Icon(
                Icons.exit_to_app,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
