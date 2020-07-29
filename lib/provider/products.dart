import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/ASUS/Desktop/e-commerce-app/fashin_shop/lib/provider/product.dart';

class Products with ChangeNotifier {
  List<Product> _productsList = [
    Product(
        id: 'p1',
        name: "Cozy creamy",
        descreption: "Cozy creamy wool",
        image: 'images/products/p1.jpeg',
        oldPrice: 150.000,
        currentPrice: 120.000),
    Product(
        id: 'p2',
        name: "Crop grey",
        descreption: "Crop grey top",
        image: 'images/products/p2.jpeg',
        oldPrice: 50.000,
        currentPrice: 35.000),
    Product(
        id: 'p3',
        name: "Black dress",
        descreption: "Black dress with lace (free size)",
        image: 'images/products/p3.jpeg',
        oldPrice: 75.000,
        currentPrice: 60.000),
    Product(
        id: 'p4',
        name: "Black bluse",
        descreption: "Black bluse ",
        image: 'images/products/p4.jpeg',
        oldPrice: 75.000,
        currentPrice: 60.000),
    Product(
        id: 'p5',
        name: "Leather pants",
        descreption: "Leather pants with fleece inside ",
        image: 'images/products/p5.jpeg',
        oldPrice: 10.000,
        currentPrice: 85.000),
    Product(
        id: 'p6',
        name: "Junmper",
        descreption: " ",
        image: 'images/products/p6.jpeg',
        oldPrice: 65.000,
        currentPrice: 50.000),
    Product(
        id: 'p7',
        name: "Fleece",
        descreption: " Fleece inside out",
        image: 'images/products/p7.jpeg',
        oldPrice: 60.000,
        currentPrice: 45.000),
    Product(
        id: 'p8',
        name: "Black skirt",
        descreption: " Black leather midi skirt with fleece inside",
        image: 'images/products/p8.jpeg',
        oldPrice: 90.000,
        currentPrice: 79.000),
    Product(
        id: 'p9',
        name: "Black takim",
        descreption: "",
        image: 'images/products/p9.jpeg',
        oldPrice: 70.000,
        currentPrice: 60.000),
    Product(
        id: 'p10',
        name: "bluse ",
        descreption: "",
        image: 'images/products/p10.jpeg',
        oldPrice: 90.000,
        currentPrice: 79.000),
  ];
  List<Product> get productsList {
    return [..._productsList];
  }
}
