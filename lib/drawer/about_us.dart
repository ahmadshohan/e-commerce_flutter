import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';
  @override
  Widget build(BuildContext context) {
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
      body: Container(
          margin: EdgeInsets.fromLTRB(15, 10, 5, 5),
          alignment: Alignment.topLeft,
          child: Text(
            'We are an online shop,based in lebanon.we care about womens style and beauty.Therefore we bring gagging fashion clothes right away from Turkey,for the best prices.Our collections suit every style!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Lato',
            ),
          )),
    );
  }
}
