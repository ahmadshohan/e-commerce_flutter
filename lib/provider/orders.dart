import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'cart_item.dart';

final fireStore = Firestore.instance;
final firebaseAuth = FirebaseAuth.instance;

class OrderItem {
  final String id;
  final int amount, quantity;
  final DateTime dateTime;
  final List<CartItem> products;
  OrderItem(
      {@required this.id,
      this.quantity,
      @required this.amount,
      @required this.dateTime,
      @required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }
//
//  final String authToken;
//  String userId;
//  Orders(this.authToken, this.userId, this._orders);

//  Future<void> fetchAndSetOrders() async {
//    final url =
//        'https://flutter-update-ad533.firebaseio.com/orders/$userId.json?auth=$authToken';
//    final response = await http.get(url);
//    final List<OrderItem> loadedOrder = [];
//    final extractedData = json.decode(response.body) as Map<String, dynamic>;
//    if (extractedData == null) {
//      return;
//    }
//    extractedData.forEach((orderId, orderData) => loadedOrder.add(OrderItem(
//        id: orderId,
//        amount: orderData['amount'],
//        dateTime: DateTime.parse(orderData['dateTime']),
//        products: (orderData['products'] as List<dynamic>)
//            .map((item) => CartItem(
//                id: item['id'],
//                title: item['title'],
//                price: item['price'],
//                quantity: item['quantity']))
//            .toList())));
//    _orders = loadedOrder.reversed.toList();
//    notifyListeners();
//  }

  Future<void> addOrder(List<CartItem> productsCart, int total) async {
//    final url =
//        'https://flutter-update-ad533.firebaseio.com/orders/$userId.json?auth=$authToken';
    FirebaseUser _user = await firebaseAuth.currentUser();
    final timestamp = DateTime.now();
    await fireStore.collection('orders').document().setData({
      'total': total,
      'dateTime': timestamp.toIso8601String(),
      'products': productsCart
          .map((cp) => {
                'id': cp.id,
                'title': cp.title,
                'price': cp.price,
                'quantity': cp.quantity
              })
          .toList()
    });
    _orders.insert(
        0,
        OrderItem(
            id: timestamp.toString(),
            amount: total,
            dateTime: timestamp,
            products: productsCart));
    notifyListeners();
  }

//  void addOrder(List<CartItem> productsCart, int total) async {
//    _orders.insert(
//      0,
//      OrderItem(
//          id: DateTime.now().toString(),
//          amount: total,
//          dateTime: DateTime.now(),
//          products: productsCart),
//    );
//    notifyListeners();
//  }
}
