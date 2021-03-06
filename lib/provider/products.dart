import 'package:flutter/cupertino.dart';
import 'cart_item.dart';

class Product with ChangeNotifier {
  final String id, category, name, descreption, image, color, size;
  final oldPrice;
  final currentPrice;
  bool isFavorite;
  Product(
      {@required this.id,
      @required this.name,
      @required this.category,
      this.color,
      this.size,
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

class Products with ChangeNotifier {
  List<Product> _productsList = [
    Product(
        id: 'tops1',
        name: "Long sleeved top",
        category: 'Tops',
        descreption: "Long sleeved top /hit of season /",
        image: 'images/products/tops/tops1.jpeg',
        oldPrice: 70000,
        currentPrice: 50000),
    Product(
        id: 'tops2',
        name: "Black elegant top",
        category: 'Tops',
        descreption: "Black elegant top",
        image: 'images/products/tops/tops2.jpeg',
        oldPrice: 50000,
        currentPrice: 30000),
    Product(
        id: 'tops3',
        name: "Trendy grey top",
        category: 'Tops',
        descreption: "Trendy grey top /fleece inside/",
        image: 'images/products/tops/tops3.jpeg',
        oldPrice: 70000,
        currentPrice: 45000),
    Product(
        id: 'tops4',
        name: "Different cotton shirts",
        category: 'Tops',
        descreption: "Different cotton shirts",
        image: 'images/products/tops/tops4.jpeg',
        oldPrice: 55000,
        currentPrice: 30000),
    Product(
        id: 'tops5',
        name: "Top fleece inside ",
        category: 'Tops',
        descreption: "Top fleece inside",
        image: 'images/products/tops/tops5.jpeg',
        oldPrice: 55000,
        currentPrice: 35000),
    Product(
        id: 'tops7',
        name: "Black top super",
        category: 'Tops',
        descreption: "Black top super",
        image: 'images/products/tops/tops7.jpeg',
        oldPrice: 55000,
        currentPrice: 45000),
    Product(
        id: 'tops8',
        name: "Trendy top ",
        category: 'Tops',
        descreption: "Trendy top with leather sleeves",
        image: 'images/products/tops/tops8.jpeg',
        oldPrice: 70000,
        currentPrice: 50000),
    Product(
        id: 'tops12',
        name: "Elegant crop top ",
        category: 'Tops',
        descreption: "Elegant crop top with paillettes",
        image: 'images/products/tops/tops12.jpeg',
        oldPrice: 80000,
        currentPrice: 65000),
    Product(
        id: 'tops13',
        name: "Chemise",
        category: 'Tops',
        descreption: "Over size standart chemise /white and navy ,blue/",
        image: 'images/products/tops/tops13.jpeg',
        oldPrice: 150000,
        currentPrice: 120000),
    Product(
        id: 'tops6',
        name: "Jumper",
        category: 'Tops',
        descreption: "orange jumber ",
        image: 'images/products/tops/tops6.jpeg',
        oldPrice: 65000,
        currentPrice: 50000),
    Product(
        id: 'tops10',
        name: "Casual wool top",
        category: 'Tops',
        descreption: "Casual wool top free size",
        image: 'images/products/tops/tops10.jpeg',
        oldPrice: 70000,
        currentPrice: 60000),
    Product(
        id: 'tops11',
        name: "Fleece",
        category: 'Tops',
        descreption: " Fleece inside out",
        image: 'images/products/tops/tops11.jpeg',
        oldPrice: 60000,
        currentPrice: 45000),
    Product(
        id: 'tops14',
        name: "Black top",
        category: 'Tops',
        descreption: "Asymetrical Black /white top/ ",
        image: 'images/products/tops/tops14.jpeg',
        oldPrice: 75000,
        currentPrice: 60000),
    Product(
        id: 'tops15',
        name: "T-shirt",
        category: 'Tops',
        descreption: "Long printed T-shirt /black and white/",
        image: 'images/products/tops/tops15.jpeg',
        oldPrice: 75000,
        currentPrice: 50000),
    Product(
        id: 'tops16',
        name: "Baby gry set ",
        category: 'Tops',
        descreption: "Baby black velvet set",
        image: 'images/products/tops/tops16.jpeg',
        oldPrice: 65000,
        currentPrice: 45000),
    Product(
        id: 'pa1',
        name: "Leather pants",
        category: 'Pants',
        descreption: "Leather pants with fleece inside ",
        image: 'images/products/pants/pa1.jpeg',
        oldPrice: 100000,
        currentPrice: 85000),
    Product(
        id: 'sk4',
        name: "Black skirt",
        category: 'Skirts',
        descreption: " Black leather midi skirt with fleece inside",
        image: 'images/products/skirts/sk4.jpeg',
        oldPrice: 90000,
        currentPrice: 79000),
    Product(
        id: 'sk1',
        name: "Short Lilas skirt",
        category: 'Skirts',
        descreption: "Short sport skirt//black-lilas",
        image: 'images/products/skirts/sk1.jpeg',
        oldPrice: 65000,
        currentPrice: 45000),
    Product(
        id: 'set6',
        name: "Lilas skirt with floral",
        category: 'Sets',
        descreption: "Lilas skirt with floral crop top/anti-winkles material/",
        image: 'images/products/sets/set6.jpeg',
        oldPrice: 120000,
        currentPrice: 100000),
    Product(
        id: 'sk3',
        name: "Short Lilas skirt",
        category: 'Skirts',
        descreption: "Short sport skirt//black-lilas",
        image: 'images/products/skirts/sk3.jpeg',
        oldPrice: 65000,
        currentPrice: 45000),
    Product(
        id: 'sk6',
        name: "Floral skirt ",
        category: 'Skirts',
        descreption: "Floral skirt with red crop top /anti wrinkles material/",
        image: 'images/products/skirts/sk6.jpeg',
        oldPrice: 130000,
        currentPrice: 100000),
    Product(
        id: 'dr16',
        name: "Cotton sweater dress",
        category: 'Dresses',
        descreption: "Cotton sweater dress",
        image: 'images/products/dress/dr16.jpeg',
        oldPrice: 90000,
        currentPrice: 79000),
    Product(
        id: 'dr1',
        name: "Midi dress",
        category: 'Dresses',
        descreption: "Midi dress with ruffels",
        image: 'images/products/dress/dr1.jpeg',
        oldPrice: 150000,
        currentPrice: 120000),
    Product(
        id: 'dr3',
        name: "corail dress ",
        category: 'Dresses',
        descreption: "dress corail one size /small/",
        image: 'images/products/dress/dr3.jpeg',
        oldPrice: 140000,
        currentPrice: 120000),
    Product(
        id: 'dr4',
        name: "Black dress",
        category: 'Dresses',
        descreption: "Black dress with lace (free size)",
        image: 'images/products/dress/dr4.jpeg',
        oldPrice: 75000,
        currentPrice: 60000),
    Product(
        id: 'dr5',
        name: "Wool dress ",
        category: 'Dresses',
        descreption: "Wool dress with leather skirt",
        image: 'images/products/dress/dr5.jpeg',
        oldPrice: 99000,
        currentPrice: 75000),
    Product(
        id: 'dr7',
        name: "Summer dress ",
        category: 'Dresses',
        descreption: "Summer dress",
        image: 'images/products/dress/dr7.jpeg',
        oldPrice: 90000,
        currentPrice: 70000),
    Product(
        id: 'dr8',
        name: "Long dress ",
        category: 'Dresses',
        descreption: "Long dress with ornament/Light pink and green/",
        image: 'images/products/dress/dr8.jpeg',
        oldPrice: 140000,
        currentPrice: 120000),
    Product(
        id: 'dr9',
        name: "Over size jumpsuit ",
        category: 'Dresses',
        descreption: "Over size jumpsuit free size /dark kaki/",
        image: 'images/products/dress/dr9.jpeg',
        oldPrice: 140000,
        currentPrice: 120000),
    Product(
        id: 'dr11',
        name: "Red dress ",
        category: 'Dresses',
        descreption: "Red dress with big sleeves",
        image: 'images/products/dress/dr11.jpeg',
        oldPrice: 65000,
        currentPrice: 35000),
    Product(
        id: 'dr12',
        name: "Long cardigan ",
        category: 'Dresses',
        descreption: "Long cardigan /faux fur pocket free size",
        image: 'images/products/dress/dr12.jpeg',
        oldPrice: 80000,
        currentPrice: 65000),
    Product(
        id: 'dr15',
        name: "Long floral dress",
        category: 'Dresses',
        descreption: "Long floral cotton dress /available in yelow",
        image: 'images/products/dress/dr15.jpeg',
        oldPrice: 150000,
        currentPrice: 120000),
    Product(
        id: 'pa2',
        name: "Gri  pants",
        category: 'Pants',
        descreption: "Gri pants ",
        image: 'images/products/pants/pa2.jpeg',
        oldPrice: 150000,
        currentPrice: 120000),
    Product(
        id: 'pa3',
        name: "Black pants",
        category: 'Pants',
        descreption: "Black pants ",
        image: 'images/products/pants/pa3.jpeg',
        oldPrice: 150000,
        currentPrice: 100000),
    Product(
        id: 'pa6',
        name: "Layered wrapped pant",
        category: 'Pants',
        descreption: "Layered wrapped pant /grey and white/ ",
        image: 'images/products/pants/pa6.jpeg',
        oldPrice: 95000,
        currentPrice: 60000),
    Product(
        id: 'pa7',
        name: "Floral high pant",
        category: 'Pants',
        descreption: "Floral high waist pant ",
        image: 'images/products/pants/pa7.jpeg',
        oldPrice: 95000,
        currentPrice: 80000),
    Product(
        id: 'pa8',
        name: "Sport ohic pant",
        category: 'Pants',
        descreption:
            "Sport ohic straight leg pant available colors/turquoise ocre/ ",
        image: 'images/products/pants/pa8.jpeg',
        oldPrice: 95000,
        currentPrice: 80000),
    Product(
        id: 'pa9',
        name: "Sport ohic comfy short pant",
        category: 'Pants',
        descreption: "Sport ohic comfy short black pant ",
        image: 'images/products/pants/pa9.jpeg',
        oldPrice: 65000,
        currentPrice: 45000),
    Product(
        id: 'set1',
        name: "Lilas DIY set",
        category: 'Sets',
        descreption: "Lilas DIY set ",
        image: 'images/products/sets/set1.jpeg',
        oldPrice: 120000,
        currentPrice: 100000),
    Product(
        id: 'set2',
        name: "Wool set ",
        category: 'Sets',
        descreption: "Wool set ",
        image: 'images/products/sets/set2.jpeg',
        oldPrice: 120000,
        currentPrice: 99000),
    Product(
        id: 'set3',
        name: "Wool set ",
        category: 'Sets',
        descreption: "Wool set ",
        image: 'images/products/sets/set3.jpeg',
        oldPrice: 120000,
        currentPrice: 99000),
    Product(
        id: 'set4',
        name: "Baby pink set ",
        category: 'Sets',
        descreption: "Baby pink velvet set",
        image: 'images/products/sets/set4.jpeg',
        oldPrice: 80000,
        currentPrice: 60000),
    Product(
        id: 'set5',
        name: "Black set ",
        category: 'Sets',
        descreption: "Black set with high collar /shiny crepe textille/",
        image: 'images/products/sets/set5.jpeg',
        oldPrice: 80000,
        currentPrice: 60000),
    Product(
        id: 'set7',
        name: "Cozy creamy",
        category: 'Sets',
        descreption: "Cozy creamy wool",
        image: 'images/products/sets/set7.jpeg',
        oldPrice: 150000,
        currentPrice: 120000),
    Product(
        id: 'sh1',
        name: "Burgundy heel ",
        category: 'Shoes',
        descreption: "Burgundy heel",
        image: 'images/products/shoes/sh1.jpeg',
        oldPrice: 65000,
        currentPrice: 45000),
    Product(
        id: 'sh2',
        name: "Red heel ",
        category: 'Shoes',
        descreption: "Red heel",
        image: 'images/products/shoes/sh2.jpeg',
        oldPrice: 75000,
        currentPrice: 60000),
  ];

  List<Product> get productsList {
    return [..._productsList];
  }

  List<Product> get favoritesProducts {
    return _productsList.where((prod) => prod.isFavorite).toList();
  }

  Product findById(String id) {
    return _productsList.firstWhere((prod) => prod.id == id);
  }

  //*******************************cartData******************
  Map<String, CartItem> _cartItems = {};
  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  int get totalAmount {
    var total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void increaseCartItemQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              color: existingCartItem.color,
              size: existingCartItem.size,
              price: existingCartItem.price,
              image: existingCartItem.image,
              quantity: existingCartItem.quantity + 1));
      notifyListeners();
    }
  }

  void decreaseCartItemQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (existingCartItem) {
        return CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            color: existingCartItem.color,
            size: existingCartItem.size,
            price: existingCartItem.price,
            image: existingCartItem.image,
            quantity: existingCartItem.quantity > 1
                ? existingCartItem.quantity - 1
                : 1);
      });
      notifyListeners();
    }
  }

  void addCart(
      {String productId,
      int price,
      String color = 'red',
      String size = 'small',
      int quantity,
      String image,
      String title}) {
    if (cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              color: existingCartItem.color,
              size: existingCartItem.size,
              price: existingCartItem.price,
              image: existingCartItem.image,
              quantity: existingCartItem.quantity + 1));
    } else {
      _cartItems.putIfAbsent(productId, () {
        return CartItem(
          id: DateTime.now().toString(),
          title: title,
          color: color,
          size: size,
          price: price,
          image: image,
          quantity: quantity,
        );
      });
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    if (_cartItems[productId].quantity > 1) {
      _cartItems.update(productId, (existingCart) {
        return CartItem(
            id: existingCart.id,
            title: existingCart.title,
            price: existingCart.price,
            quantity: existingCart.quantity - 1);
      });
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
