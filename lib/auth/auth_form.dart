import 'dart:math';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AuthForm extends StatefulWidget {
  final bool isLoading;
  AuthForm(this.submitFn, this.googleSignIn, this.isLoading);
  final void Function(String email, String userName, String password,
      BuildContext ctx, bool isLogin) submitFn;
  final void Function() googleSignIn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfrirmController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordConfirmFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  var _isLogin = true;
  var _userName = '';
  var _emailAddress = '';
  var _password = '';
  bool hidePassword = true;
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(
      begin: Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
      end: Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _passwordController.dispose();
    _passwordConfrirmController.dispose();
    emailFocusNode.dispose();
    userNameFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmFocusNode.dispose();
  }

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
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Stack(
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
                        margin: EdgeInsets.only(left: 18),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 96.0),
                        transform: Matrix4.rotationZ(-8 * pi / 270)
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
                        child: TyperAnimatedTextKit(
                          text: ['Style ecorner'],
                          speed: Duration(seconds: 1),
                          isRepeatingAnimation: false,
                          textStyle: TextStyle(
                            color:
                                Theme.of(context).accentTextTheme.title.color,
                            fontSize: 30,
                            fontFamily: 'Anton',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Card(
                        color: Colors.white70,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 16),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextFormField(
                                      key: ValueKey('email'),
                                      focusNode: emailFocusNode,
                                      textInputAction: TextInputAction.next,
                                      autocorrect: false,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      enableSuggestions: false,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _isLogin
                                                ? passwordFocusNode
                                                : userNameFocusNode);
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Email adress',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.1,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.grey,
                                        ),
                                      ),
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
                                    SizedBox(
                                      height: 6,
                                    ),
                                    if (!_isLogin)
                                      TextFormField(
                                        key: ValueKey('username'),
                                        autocorrect: true,
                                        textInputAction: TextInputAction.next,
                                        focusNode: userNameFocusNode,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        enableSuggestions: true,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(passwordFocusNode);
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'User Name',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 0.1,
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              value.length < 4) {
                                            return 'User Name must be at Least 4 characters.';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _userName = value;
                                        },
                                      ),
                                    if (!_isLogin)
                                      SizedBox(
                                        height: 6,
                                      ),
                                    TextFormField(
                                      key: ValueKey('password'),
                                      controller: _passwordController,
                                      focusNode: passwordFocusNode,
                                      onFieldSubmitted: (_) {
                                        if (_isLogin) {
                                          _trySubmet();
                                        } else {
                                          FocusScope.of(context).requestFocus(
                                            passwordConfirmFocusNode,
                                          );
                                        }
                                      },
                                      textInputAction: _isLogin
                                          ? TextInputAction.done
                                          : TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.1,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              hidePassword = !hidePassword;
                                            });
                                          },
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      obscureText: hidePassword,
                                      validator: (value) {
                                        if (value.isEmpty || value.length < 7) {
                                          return 'Password must be at least 7 characters long.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _password = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (!_isLogin)
                                      TextFormField(
                                          key: ValueKey('confirmPassword'),
                                          focusNode: passwordConfirmFocusNode,
                                          decoration: InputDecoration(
                                            labelText: 'Confirm password',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 0.1,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.remove_red_eye,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  hidePassword = !hidePassword;
                                                });
                                              },
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock_outline,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          onFieldSubmitted: (_) => _trySubmet(),
                                          controller:
                                              _passwordConfrirmController,
                                          keyboardType: TextInputType.number,
                                          obscureText: hidePassword,
                                          validator: (value) {
                                            if (value.isEmpty ||
                                                value.length < 7) {
                                              return 'Password must be at least 7 characters long.';
                                            } else if (_passwordController
                                                    .text !=
                                                value) {
                                              return 'Password do not match.';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _password = value;
                                          }),
                                    if (widget.isLoading)
                                      Center(
                                        child: kSpinkit,
                                      ),
                                    if (!widget.isLoading)
                                      RaisedButton(
                                          shape: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          textColor: Colors.white,
                                          color: Colors.deepOrange.shade900,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 115,
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                _isLogin ? 'Login' : 'Signup',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed: _trySubmet),
                                    if (!widget.isLoading)
                                      FlatButton(
                                          textColor:
                                              Theme.of(context).primaryColor,
                                          onPressed: () {
                                            setState(() {
                                              _isLogin = !_isLogin;
                                            });
                                          },
                                          child: _isLogin
                                              ? RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text:
                                                          'Dont have an account? ',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Signup',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                      ),
                                                    )
                                                  ]),
                                                )
                                              : RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text:
                                                          'I already have account?  ',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Login',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                      ),
                                                    )
                                                  ]),
                                                )),
                                  ],
                                ),
                              ),
                            ),
                            if (!_isLogin) Divider(),
                            if (!_isLogin)
                              Text(
                                'Sign in with social accounts',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
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
                                            image: AssetImage(
                                                'images/facebook.png'),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          textColor: Colors.white,
                                          color:
                                              Color.fromRGBO(66, 103, 178, 1),
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
                                          image:
                                              AssetImage('images/google.png'),
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
                                        onPressed: widget.googleSignIn,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: RaisedButton.icon(
                                          icon: Image(
                                            image:
                                                AssetImage('images/apple.png'),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          textColor: Colors.black87,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
