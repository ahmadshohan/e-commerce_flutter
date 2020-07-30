import 'package:fashinshop/category/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryHorizentalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryItem(
            categoryId: 'Tops',
            categoryImage: 'images/products/tops/tops1.jpeg',
          ),
          CategoryItem(
            categoryId: 'Dresses',
            categoryImage: 'images/products/dress/dr3.jpeg',
          ),
          CategoryItem(
            categoryId: 'Pants',
            categoryImage: 'images/products/pants/pa8.jpeg',
          ),
          CategoryItem(
            categoryId: 'Sets',
            categoryImage: 'images/products/sets/set1.jpeg',
          ),
          CategoryItem(
            categoryId: 'Skirts',
            categoryImage: 'images/products/skirts/sk3.jpeg',
          ),
          CategoryItem(
            categoryId: 'Shoes',
            categoryImage: 'images/products/shoes/sh1.jpeg',
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String categoryImage;
  final String categoryId;
  CategoryItem({this.categoryImage, this.categoryId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CategorySelected.routeName,
              arguments: categoryId);
        },
        child: Container(
          width: 100,
          child: ListTile(
            title: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                categoryImage,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                categoryId,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
