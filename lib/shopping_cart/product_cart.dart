import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/data_lists.dart';

class ProductCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: productsCartList.length,
        itemBuilder: (ctx, index) => SingleProductCart(
          productCartName: productsCartList[index]['name'],
          productCartImage: productsCartList[index]['image'],
          productCartColor: productsCartList[index]['color'],
          productCartPrice: productsCartList[index]['price'],
          productCartQuantity: productsCartList[index]['quantity'],
          productCartSize: productsCartList[index]['size'],
        ),
      ),
    );
  }
}

class SingleProductCart extends StatelessWidget {
  final productCartName;
  final productCartImage;
  final productCartSize;
  final productCartPrice;
  final productCartColor;
  final productCartQuantity;
  SingleProductCart(
      {this.productCartName,
      this.productCartImage,
      this.productCartColor,
      this.productCartPrice,
      this.productCartSize,
      this.productCartQuantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide.none,
      ),
      child: ListTile(
        leading: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                productCartImage,
              ),
            ),
          ],
        ),
        title: Text(productCartName),
        subtitle: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Size:'),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          productCartSize,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: Text(
                          'Color:',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          productCartColor,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "$productCartPrice\$",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    ),
                    Text(
                      "$productCartQuantity",
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
