import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../shop_drawer.dart';
import 'package:fashinshop/provider/orders.dart';
import 'single_order.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = '/orders-page';
  // // @override
  // // void initState() {
  // //   // Future.delayed(Duration.zero).then((_) async {
  // //   _isLoading = true;
  // //   Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
  // //     setState(() {
  // //       _isLoading = false;
  // //     });
  // //   });

  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    // final ordreData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: Text('Your Orders'),
        ),
        drawer: ShopDrawer(),
        body: FutureBuilder(
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
                      ));
            }
          }
        }));
  }
}
