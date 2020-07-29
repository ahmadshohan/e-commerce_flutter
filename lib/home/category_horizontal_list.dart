import 'package:fashinshop/category/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizentalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image: 'images/cats/tshirt.png',
            imageCaption: 'shirt',
          ),
          Category(
            image: 'images/cats/dress.png',
            imageCaption: 'dress',
          ),
          Category(
            image: 'images/cats/formal.png',
            imageCaption: 'formal',
          ),
          Category(
            image: 'images/cats/informal.png',
            imageCaption: 'informal',
          ),
          Category(
            image: 'images/cats/jeans.png',
            imageCaption: 'pants',
          ),
          Category(
            image: 'images/cats/shoe.png',
            imageCaption: 'shoe',
          ),
          Category(
            image: 'images/cats/accessories.png',
            imageCaption: 'others',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  final String imageCaption;
  Category({this.image, this.imageCaption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CategoryItem.routeName,
              arguments: imageCaption);
        },
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                imageCaption,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
