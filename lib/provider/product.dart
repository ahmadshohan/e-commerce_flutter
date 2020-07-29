import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final String descreption;
  final String image;
  final double oldPrice;
  final double currentPrice;
  bool isFavorite;
  Product({
    @required this.id,
    @required this.name,
    @required this.descreption,
    @required this.image,
    @required this.oldPrice,
    @required this.currentPrice,
  });
}
