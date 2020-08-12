import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> fetchAndSetOrders() async {
    FirebaseUser _user = await firebaseAuth.currentUser();
    final List<OrderItem> loadedOrder = [];
    QuerySnapshot response = await fireStore
        .collection('orders')
        .where('id', isEqualTo: _user.uid)
        .getDocuments();
    List<DocumentSnapshot> allDocuments = response.documents;
    if (allDocuments == null) {
      return;
    } else {
      allDocuments.forEach((document) {
        var documentData = document.data;
        loadedOrder.add(
          OrderItem(
            id: _user.uid,
            amount: documentData['total'],
            dateTime: DateTime.parse(documentData['dateTime']),
            products: (documentData['products'] as List<dynamic>)
                .map(
                  (item) => CartItem(
                      id: item['id'],
                      title: item['title'],
                      price: item['price'],
                      quantity: item['quantity']),
                )
                .toList(),
          ),
        );
      });

      _orders = loadedOrder.reversed.toList();
      notifyListeners();
    }
  }

  Future<void> addOrder(List<CartItem> productsCart, int total) async {
    FirebaseUser _user = await firebaseAuth.currentUser();
    final timestamp = DateTime.now();
    await fireStore.collection('orders').document('${_user.uid}').setData({
      'id': _user.uid,
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
