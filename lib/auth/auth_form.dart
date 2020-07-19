import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final bool isLoading;
  AuthForm(this.submitFn, this.signInWithGoogle, this.isLoading);
  final void Function(String email, String userName, String password,
      BuildContext ctx, bool isLogin) submitFn;
  final void Function() signInWithGoogle;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userName = '';
  var _emailAddress = '';
  var _password = '';

  void _trySubmet() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_emailAddress.trim(), _userName.trim(), _password.trim(),
          context, _isLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    transformConfig.translate(-10.0);
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 96.0),
                    transform: Matrix4.rotationZ(-8 * pi / 180)
                      ..translate(-9.0),
                    // ..translate(-10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade900,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Text(
                      'FashionShop',
                      style: TextStyle(
                        color: Theme.of(context).accentTextTheme.title.color,
                        fontSize: 30,
                        fontFamily: 'Anton',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: deviceSize.width > 600 ? 2 : 2,
                    child: Card(
                      color: Colors.white70,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextFormField(
                                    key: ValueKey('email'),
                                    autocorrect: false,
                                    textCapitalization: TextCapitalization.none,
                                    enableSuggestions: false,
                                    decoration: InputDecoration(
                                        labelText: 'Email adress'),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Please enter a valid Email adress';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _emailAddress = value;
                                    },
                                  ),
                                  if (!_isLogin)
                                    TextFormField(
                                      key: ValueKey('username'),
                                      autocorrect: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      enableSuggestions: true,
                                      decoration: InputDecoration(
                                          labelText: 'User Name'),
                                      validator: (value) {
                                        if (value.isEmpty || value.length < 4) {
                                          return 'User Name must be at Least 4 characters.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userName = value;
                                      },
                                    ),
                                  TextFormField(
                                      key: ValueKey('password'),
                                      decoration: InputDecoration(
                                          labelText: 'Password'),
                                      keyboardType: TextInputType.number,
                                      obscureText: true,
                                      validator: (value) {
                                        if (value.isEmpty || value.length < 7) {
                                          return 'Password must be at least 7 characters long.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _password = value;
                                      }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (widget.isLoading)
                                    Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  if (!widget.isLoading)
                                    RaisedButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 55),
                                        shape: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.deepOrange.shade900,
                                        child: Text(
                                          _isLogin ? 'Login' : 'Signup',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        onPressed: _trySubmet),
                                  if (!widget.isLoading)
                                    FlatButton(
                                      textColor: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        setState(() {
                                          _isLogin = !_isLogin;
                                        });
                                      },
                                      child: Text(
                                        _isLogin
                                            ? 'Create new account'
                                            : 'I already have an acount',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          if (!_isLogin) Divider(),
                          if (!_isLogin)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 13,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: RaisedButton.icon(
                                        icon: Image(
                                          image:
                                              AssetImage('images/facebook.png'),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        textColor: Colors.white,
                                        color: Color.fromRGBO(66, 103, 178, 1),
                                        label: Text(
                                          'Facebook',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        onPressed: () {}),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: RaisedButton.icon(
                                      icon: Image(
                                        image: AssetImage('images/google.png'),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      textColor: Colors.white,
                                      color: Color.fromRGBO(219, 68, 55, 1),
                                      label: Text(
                                        'Google',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      onPressed: widget.signInWithGoogle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: RaisedButton.icon(
                                        icon: Image(
                                          image: AssetImage('images/apple.png'),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        textColor: Colors.black87,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        label: Text(
                                          'Apple',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        onPressed: () {}),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
