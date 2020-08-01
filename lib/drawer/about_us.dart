import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: TyperAnimatedTextKit(
          text: ['Style ecorner'],
          speed: Duration(seconds: 1),
          isRepeatingAnimation: true,
          textStyle: TextStyle(
            color: Theme.of(context).accentTextTheme.title.color,
            fontSize: 25,
            fontFamily: 'Anton',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: hight * 0.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'images/products/dress/dr3.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: hight * 0.37,
                  left: (width / 2) - 50,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/logo.jpeg',
                    width: 100,
                    height: 100,
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "Online boutique Style ecorner",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'We are an online shop,based in lebanon.we care about womens style and beauty.Therefore we bring gagging fashion clothes right away from Turkey,for the best prices.Our collections suit every style!',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
