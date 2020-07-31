import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/data_lists.dart';

class SingleProductCart extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final int price;
  final int quantity;
  SingleProductCart(
      {this.id, this.title, this.image, this.price, this.quantity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
      ),
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide.none,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
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
                        title,
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
                              'M',
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
                              'M',
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
                                  text: '$price ',
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
                                  text: '${price * quantity} ',
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
                  onPressed: () {},
                ),
                Text(
                  "$quantity X",
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
