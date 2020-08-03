import 'package:flutter/foundation.dart';

class CartItem {
  final String id, title, color, size;
  final int price;
  final String image;
  int quantity = 0;
  CartItem(
      {@required this.id,
      @required this.title,
      this.color,
      this.size,
      @required this.price,
      @required this.image,
      @required this.quantity});
}
