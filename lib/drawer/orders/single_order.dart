import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fashinshop/provider/orders.dart';

class SingleOrder extends StatefulWidget {
  final OrderItem order;
  SingleOrder(this.order);

  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height:
          _expanded ? min(widget.order.products.length * 20.0 + 120, 200) : 110,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Row(
                children: <Widget>[
                  Text(
                    'Total :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '${widget.order.amount} ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        TextSpan(
                          text: 'LL',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    'Date :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(DateFormat('dd/MM/yyyy/ hh:mm')
                      .format(widget.order.dateTime)),
                ],
              ),
              trailing: IconButton(
                  icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  }),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: _expanded
                    ? min(widget.order.products.length * 20.0 + 15, 100)
                    : 0,
                child: ListView(
                  children: widget.order.products
                      .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                prod.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${prod.quantity} x ${prod.price}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
