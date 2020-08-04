import 'package:flutter/material.dart';
import 'package:fashinshop/taps_page.dart';
import './auth/auth_page.dart';
import 'components/constants.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome-page';

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool _isLoading = false;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: hight * 0.60,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'images/products/dress/dr3.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: hight * 0.55, left: (width / 2) - 42.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/logo.jpeg',
                    width: 85,
                    height: 85,
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome in Style ecorner",
              style: TextStyle(
                  color: Color(0xFF3C3C3C),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Browse our application as',
                  style: TextStyle(color: Color(0xFF3C3C3C), fontSize: 20),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, TabsPage.routeName);
                  },
                  child: _isLoading
                      ? Center(
                          child: kSpinkit,
                        )
                      : const Text(
                          ' Visitor',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                          textDirection: TextDirection.rtl,
                        ),
                ),
              ],
            ),
            SizedBox(
              height: hight * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 160,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AuthPage.routeName);
                    },
                    color: Colors.black,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    child: const Text(
                      'Signup / Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
