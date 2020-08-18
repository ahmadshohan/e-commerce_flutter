import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';
  Future launchURL() async {
    const url = 'https://instagram.com/styl_ecorner?igshid=upqj2nbq7eeq';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/products/dress/dr3.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.37,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Text(
                      'We are an online shop,based in lebanon.we care about womens style and beauty.Therefore we bring gagging fashion clothes right away from Turkey,for the best prices.Our collections suit every style!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Lato',
                      ),
                    ),
                    Divider(),
                    Text(
                      'Contact us :',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              FlutterOpenWhatsapp.sendSingleMessage(
                                "963951541016",
                                "Hello",
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                    height: 30,
                                    child: Image.asset('images/whatsup.png')),
                                Text(
                                  'Whatsup',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: launchURL,
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  child: Image.asset(
                                    'images/instagram.jpg',
                                  ),
                                ),
                                Text(
                                  'Instagram',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
