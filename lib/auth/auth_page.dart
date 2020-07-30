import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../auth/auth_form.dart';

import '../home/home_page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
//    isSignedInWithGoogle();
  }

  void isSignedInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> handleGoogleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });

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
      setState(() {
        _isLoading = false;
      });

      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      Toast.show("login failed", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  Future<void> handleGoogleSignOut() async {
    await firebaseAuth.signOut().then((value) {
      googleSignIn.signOut();
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _submitAuthForm(
    String email,
    String username,
    String password,
    BuildContext ctx,
    bool isLogin,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });
      FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      if (isLogin) {
        authResult = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else if (isLogin == false || firebaseUser == null) {
        authResult = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        fireStore
            .collection('users')
            .document('${authResult.user.uid}')
            .setData({
          'username': username,
          'email': authResult.user.email,
          'userid': authResult.user.uid,
        });
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
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            }
            return AuthForm(_submitAuthForm, handleGoogleSignIn, _isLoading);
          }),
    );
  }
}
