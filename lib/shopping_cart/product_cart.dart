import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../components/constants.dart';

class SingleProductCart extends StatefulWidget {
  final String cartId, productId, title, color, size, image;
  int price, quantity;

  SingleProductCart({
    this.cartId,
    this.productId,
    this.title,
    this.color,
    this.size,
    this.image,
    this.price,
    this.quantity,
  });

  @override
  _SingleProductCartState createState() => _SingleProductCartState();
}

class _SingleProductCartState extends State<SingleProductCart> {
  bool isInit = true;
  var cart;
  var cartItems;
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      cart = Provider.of<Products>(
        context,
      );
      cartItems = cart.cartItems;
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
      ),
      child: Dismissible(
        key: ValueKey(widget.cartId),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          Provider.of<Products>(context, listen: false)
              .removeItem(widget.productId);
        },
        confirmDismiss: (direction) {
          return showConfirmDialog(context);
        },
        background: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(
            right: 20,
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3C3C3C)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Size:'),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                widget.size,
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
                                widget.color,
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
                        Row(
                          children: <Widget>[
                            Text('1 X :'),
                            SizedBox(
                              width: 17,
                            ),
                            Chip(
                              label: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '${widget.price} ',
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
                        Row(
                          children: <Widget>[
                            Text('total :'),
                            SizedBox(
                              width: 10,
                            ),
                            Chip(
                              label: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '${widget.price * widget.quantity} ',
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
                      ]),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {
                        cart.increaseQuantity(widget.productId);
                      }),
                  Text(
                    "${widget.quantity} X",
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        cart.decreaseQuantity(widget.productId);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
