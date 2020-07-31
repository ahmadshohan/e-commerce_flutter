import 'package:flutter/material.dart';
import './auth/auth_page.dart';
import 'constants.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome-page';

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool _isLoading = false;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
                height: hight * 0.60,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('images/bg.png', fit: BoxFit.fill)),
            Padding(
              padding:
                  EdgeInsets.only(top: hight * 0.55, left: (width / 2) - 42.5),
              child: Image.asset(
                '',
                width: 85,
                height: 85,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
//                  _submit();
                },
                child: _isLoading
                    ? Center(
                        child: kSpinkit,
                      )
                    : const Text(
                        ' كزائر',
                        style: TextStyle(
                            color: Color(0xFF3C3C3C),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                        textDirection: TextDirection.rtl,
                      ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'تصفح التطبيق',
                style: TextStyle(color: Color(0xFF3C3C3C), fontSize: 20),
                textDirection: TextDirection.rtl,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => AuthPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "انشاء الحساب",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          backgroundColor: Colors.white,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 60,
                width: 160,
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.black,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  child: const Text(
                    "تسجيل الدخول",
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
      )),
    );
  }
}
