//import 'package:flutter/cupertino.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//
//import '../home/home_page.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:toast/toast.dart';
//
//class LoginSocial {
//  final firebaseAuth = FirebaseAuth.instance;
//  GoogleSignIn googleSignIn = GoogleSignIn(
//    scopes: [
//      'email',
//      'https://www.googleapis.com/auth/contacts.readonly',
//    ],
//  );
//  final fireStore = Firestore.instance;
//  FirebaseUser _user;
//  SharedPreferences preferences;
//  bool isLogedin = false;
//  AuthResult authResult;
//  void isSignedInWithGoogle(BuildContext context) async {
//    preferences = await SharedPreferences.getInstance();
//    isLogedin = await googleSignIn.isSignedIn();
//    if (isLogedin) {
//      Navigator.pushReplacementNamed(context, HomePage.routeName);
//    }
//  }
//
//  Future<void> handleGoogleSignIn(BuildContext context) async {
//    preferences = await SharedPreferences.getInstance();
//    GoogleSignInAccount googleUser = await googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication =
//        await googleUser.authentication;
//    AuthCredential credential = GoogleAuthProvider.getCredential(
//      idToken: googleSignInAuthentication.idToken,
//      accessToken: googleSignInAuthentication.accessToken,
//    );
//    AuthResult result = await firebaseAuth.signInWithCredential(credential);
//    _user = result.user;
//
//    if (result != null) {
//      final QuerySnapshot querySnapshot = await fireStore
//          .collection('users')
//          .where('id', isEqualTo: _user.uid)
//          .getDocuments();
//      final List<DocumentSnapshot> documents = querySnapshot.documents;
//      if (documents.length == 0) {
//        await fireStore.collection('users').document("${_user.uid}").setData({
//          'id': _user.uid,
//          'username': _user.displayName,
//          'email': _user.email,
//          'profilePicture': _user.photoUrl,
//        });
//        await preferences.setString('id', _user.uid);
//        await preferences.setString('username', _user.displayName);
//        await preferences.setString('email', _user.email);
//        await preferences.setString('profilePicture', _user.photoUrl);
//      } else {
//        await preferences.setString('id', documents[0]['id']);
//        await preferences.setString('username', documents[0]['username']);
//        await preferences.setString('email', documents[0]['email']);
//        await preferences.setString(
//            'profilePicture', documents[0]['profilePicture']);
//      }
//      Toast.show("success login", context,
//          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
//
//      Navigator.pushReplacementNamed(context, HomePage.routeName);
//    } else {
//      Toast.show("login failed", context,
//          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
//    }
//  }
//
//  Future<void> handleGoogleSignOut() async {
//    await firebaseAuth.signOut().then((value) {
//      googleSignIn.signOut();
//    });
//  }
//}
