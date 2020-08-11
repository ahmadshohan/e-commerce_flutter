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

//  String userId;
//  Orders(this.userId, this._orders);

//  Future<void> fetchAndSetOrders() async {
//    FirebaseUser _user = await firebaseAuth.currentUser();
//    final response = await fireStore
//        .collection('orders')
//        .where('id', isEqualTo: _user.uid)
//        .getDocuments();
//    final List<OrderItem> loadedOrder = [];
//    List<DocumentSnapshot> allDocuments = response.documents;
//    if (allDocuments.length == 0) {
//      return;
//    } else {
//      allDocuments.forEach((document) {
//        loadedOrder.add(OrderItem(
//            id: userId,
//            amount: document['amount'],
//            dateTime: DateTime.parse(document['dateTime']),
//            products: (document['products'] as List<dynamic>).map((item) =>
//                CartItem(
//                    id: item['id'],
//                    title: item['title'],
//                    price: item['price'],
//                    image: null,
//                    quantity: item['quantity']))));
//      });
//
//      _orders = loadedOrder.reversed.toList();
//      notifyListeners();
//    }
//  }

  Future<void> addOrder(List<CartItem> productsCart, int total) async {
    FirebaseUser _user = await firebaseAuth.currentUser();
    final timestamp = DateTime.now();
    await fireStore.collection('orders').document('${_user.uid}').setData({
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
            id: _user.uid,
            amount: total,
            dateTime: timestamp,
            products: productsCart));
    notifyListeners();
  }
}
