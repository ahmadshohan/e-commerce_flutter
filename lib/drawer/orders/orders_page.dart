import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../taps_page.dart';
import '../shop_drawer.dart';
import 'package:fashinshop/provider/orders.dart';
import '../all_products.dart';
import 'single_order.dart';

class OrdersPage extends StatefulWidget {
  static const routeName = '/orders-page';

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool _isLoading = false;
//  @override
//  void initState() {
//    super.initState();
//    Future.delayed(Duration.zero).then((_) async {
//      _isLoading = true;
//      Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
//        setState(() {
//          _isLoading = false;
//        });
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final ordreData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Your Orders'),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, TapsPage.routeName),
          ),
        ],
      ),
      drawer: ShopDrawer(),
      body: ordreData.orders.isEmpty || _isLoading
          ? Center(
              child: Text(
                'Not found items in your order page please add an order !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )
          : FutureBuilder(
//            future:
//                Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
              builder: (ctx, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (dataSnapshot.error != null) {
                  return Center(child: Text('error occured'));
                } else {
                  return Consumer<Orders>(
                    builder: (ctx, orderData, child) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: ListView.builder(
                        itemCount: orderData.orders.length,
                        itemBuilder: (ctx, i) =>
                            SingleOrder(orderData.orders[i]),
                      ),
                    ),
                  );
                }
              }
            }),
      floatingActionButton: ordreData.orders.isEmpty
          ? FloatingActionButton(
              child: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AllProducts.routeName);
              },
            )
          : null,
    );
  }
}
