import 'package:flutter/material.dart';
import '../shopping_cart/shopping_cart_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_page.dart';

class ShopDrawer extends StatelessWidget {
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = Firestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

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
            accountName: Text('A7mad Sho7an'),
            accountEmail: Text('ahmad.shohan523@gmail.com'),
            currentAccountPicture: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
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
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My account'),
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              ShoppingCart.routeName,
            ),
            child: ListTile(
              title: Text('Shopping cart'),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
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
            onTap: () {},
            child: ListTile(
              title: Text('About'),
              leading: Icon(
                Icons.help,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              firebaseAuth.signOut();
//              handleGoogleSignOut();
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
