import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  final int quantity;
  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.image,
      @required this.quantity});
}
