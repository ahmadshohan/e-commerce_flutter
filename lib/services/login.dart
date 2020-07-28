import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Login extends ChangeNotifier {
  final firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final fireStore = Firestore.instance;
  FirebaseUser _user;
  SharedPreferences preferences;
  bool isLogedin = false;
  AuthResult authResult;
  void isSignedInWithGoogle(bool isLoading, BuildContext context) async {
    isLoading = true;

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
    isLoading = false;
  }

  Future<void> handleGoogleSignIn(bool isLoading, BuildContext context) async {
    preferences = await SharedPreferences.getInstance();

    isLoading = true;

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    AuthResult result = await firebaseAuth.signInWithCredential(credential);
    _user = result.user;

    if (result != null) {
      final QuerySnapshot querySnapshot = await fireStore
          .collection('users')
          .where('id', isEqualTo: _user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = querySnapshot.documents;
      if (documents.length == 0) {
        await fireStore.collection('users').document("${_user.uid}").setData({
          'id': _user.uid,
          'username': _user.displayName,
          'email': _user.email,
          'profilePicture': _user.photoUrl,
        });
        await preferences.setString('id', _user.uid);
        await preferences.setString('username', _user.displayName);
        await preferences.setString('email', _user.email);
        await preferences.setString('profilePicture', _user.photoUrl);
      } else {
        await preferences.setString('id', documents[0]['id']);
        await preferences.setString('username', documents[0]['username']);
        await preferences.setString('email', documents[0]['email']);
        await preferences.setString(
            'profilePicture', documents[0]['profilePicture']);
      }
      Toast.show("success login", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

      isLoading = false;

      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      Toast.show("login failed", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  void _submitAuthForm(String email, String username, String password,
      BuildContext ctx, bool isLogin, bool isLoading) async {
    try {
      isLoading = true;

      if (isLogin) {
        authResult = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred ,Please check your credentials';
      if (err.message != null) {
        message = err.message;
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));

      isLoading = false;
    } catch (err) {
      print(err);

      isLoading = false;
    }
  }

  Future<void> handleGoogleSignOut(bool isLoading) async {
    await firebaseAuth.signOut().then((value) {
      googleSignIn.signOut();

      isLoading = false;
    });
  }
}
