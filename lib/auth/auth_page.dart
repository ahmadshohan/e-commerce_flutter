import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../provider/login_social.dart';
import '../auth/auth_form.dart';
import '../taps_page.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth-page';
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final loginSocial = Provider.of<LoginSocial>(context);
      loginSocial.isSignedInWithGoogle(context);
      _isInit = false;
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
              return TapsPage();
            }
            return AuthForm();
          }),
    );
  }
}
