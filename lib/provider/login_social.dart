import 'package:fashinshop/taps_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_page.dart';
import 'package:toast/toast.dart';

class LoginSocial with ChangeNotifier {
  bool isLoading = false;
  String _userId;
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = Firestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final facebookLogin = FacebookLogin();
  SharedPreferences preferences;
  FirebaseUser _firebaseUser;
  bool isLogedin = false;
  AuthResult authResult;
  String get userId {
    return _userId;
  }

  void isSignedInWithGoogle(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> handleGoogleSignIn(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      preferences = await SharedPreferences.getInstance();
      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      isLoading = false;
      notifyListeners();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      authResult = await firebaseAuth.signInWithCredential(credential);

      _firebaseUser = authResult.user;

      if (authResult != null) {
        final QuerySnapshot querySnapshot = await fireStore
            .collection('users')
            .where('id', isEqualTo: _firebaseUser.uid)
            .getDocuments();
        final List<DocumentSnapshot> documents = querySnapshot.documents;
        if (documents.length == 0) {
          await fireStore
              .collection('users')
              .document("${_firebaseUser.uid}")
              .setData({
            'id': _firebaseUser.uid,
            'username': _firebaseUser.displayName,
            'email': _firebaseUser.email,
            'profilePicture': _firebaseUser.photoUrl,
          });

          await preferences.setString('id', _firebaseUser.uid);
          await preferences.setString('username', _firebaseUser.displayName);
          await preferences.setString('email', _firebaseUser.email);
          await preferences.setString('profilePicture', _firebaseUser.photoUrl);
        } else {
          _userId = documents[0]['id'];
          await preferences.setString('id', documents[0]['id']);
          await preferences.setString('username', documents[0]['username']);
          await preferences.setString('email', documents[0]['email']);
          await preferences.setString(
              'profilePicture', documents[0]['profilePicture']);
        }
        Toast.show("success login", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

        Navigator.pushReplacementNamed(context, HomePage.routeName);
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        Toast.show("login failed", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> handleGoogleSignOut() async {
    try {
      isLoading = true;
      notifyListeners();
      await firebaseAuth.signOut().then((value) {
        googleSignIn.signOut();
        _userId = null;
        preferences.clear();
        isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }

  void isSignedInWithFaceBook(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    preferences = await SharedPreferences.getInstance();
    isLogedin = await facebookLogin.isLoggedIn;
    if (isLogedin) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> handleFacebookSignIn(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      preferences = await SharedPreferences.getInstance();
      final result = await facebookLogin.logIn(['email']);
      debugPrint(result.status.toString());
      if (result.status == FacebookLoginStatus.loggedIn) {
        AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        );
        authResult = await firebaseAuth.signInWithCredential(credential);
        _firebaseUser = authResult.user;

        notifyListeners();
        if (authResult != null) {
          final QuerySnapshot querySnapshot = await fireStore
              .collection('users')
              .where('id', isEqualTo: _firebaseUser.uid)
              .getDocuments();
          final List<DocumentSnapshot> documents = querySnapshot.documents;
          if (documents.length == 0) {
            await fireStore
                .collection('users')
                .document("${_firebaseUser.uid}")
                .setData({
              'id': _firebaseUser.uid,
              'username': _firebaseUser.displayName,
              'email': _firebaseUser.email,
              'profilePicture': _firebaseUser.photoUrl,
            });

            await preferences.setString('id', _firebaseUser.uid);
            await preferences.setString('username', _firebaseUser.displayName);
            await preferences.setString('email', _firebaseUser.email);
            await preferences.setString(
                'profilePicture', _firebaseUser.photoUrl);
          } else {
            await preferences.setString('id', documents[0]['id']);
            await preferences.setString('username', documents[0]['username']);
            await preferences.setString('email', documents[0]['email']);
            await preferences.setString(
                'profilePicture', documents[0]['profilePicture']);
          }
          _userId = documents[0]['id'];
          isLoading = false;
          notifyListeners();
          Toast.show("success login", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

          Navigator.pushReplacementNamed(context, TapsPage.routeName);
        } else {
          isLoading = false;
          notifyListeners();
          Toast.show("login failed", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
      } else if (result.status == FacebookLoginStatus.cancelledByUser) {
        isLoading = false;
        notifyListeners();
        Toast.show('Cancelled Login', context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      } else {
        isLoading = false;
        notifyListeners();
        Toast.show(result.errorMessage, context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> handleFacebookSignOut() async {
    try {
      isLoading = true;
      notifyListeners();
      await firebaseAuth.signOut().then((value) {
        facebookLogin.logOut();
        _userId = null;
        preferences.clear();
        isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }

  void submitAuthForm(
    String email,
    String username,
    String password,
    BuildContext ctx,
    bool isLogin,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      FirebaseUser firebaseUser = await firebaseAuth.currentUser();
      if (isLogin) {
        authResult = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        _userId = authResult.user.uid;
        notifyListeners();
        await preferences.setString('id', authResult.user.uid);
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
        _userId = authResult.user.uid;
        await preferences.setString('id', authResult.user.uid);
        notifyListeners();
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
      notifyListeners();
    } catch (err) {
      print(err);

      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOutEmailPassword() async {
    await firebaseAuth.signOut();
    _userId = null;
    preferences.clear();
    notifyListeners();
  }
}
