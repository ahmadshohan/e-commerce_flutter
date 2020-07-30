import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String category;
  final String name;
  final String descreption;
  final String image;
  final oldPrice;
  final currentPrice;
  bool isFavorite;
  Product(
      {@required this.id,
      @required this.name,
      @required this.category,
      @required this.descreption,
      @required this.image,
      @required this.oldPrice,
      @required this.currentPrice,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
