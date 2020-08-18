import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../taps_page.dart';

class RateUs extends StatefulWidget {
  static const routeName = '/rate-us';
  @override
  _RateUsState createState() => new _RateUsState();
}

class _RateUsState extends State<RateUs> {
  double rating = 2.5;
  int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: TyperAnimatedTextKit(
          text: ['Rate us'],
          speed: Duration(seconds: 1),
          isRepeatingAnimation: false,
          textStyle: TextStyle(
            color: Theme.of(context).accentTextTheme.title.color,
            fontSize: 25,
            fontFamily: 'Anton',
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, TapsPage.routeName),
          ),
        ],
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(
              bottom: 50.0,
            ),
            child: new StarRating(
              size: 45.0,
              rating: rating,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  this.rating = rating;
                },
              ),
            ),
          ),
          new Text(
            "Your rating is: $rating",
            style: new TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
