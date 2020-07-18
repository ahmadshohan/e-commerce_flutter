import 'package:flutter/material.dart';
import '../home/home_page.dart';
import 'similar_product.dart';
import '../components/data_lists.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectSize = 'small';
  String selectColor = 'red';
  String selectQuantity = '1';

  DropdownButton<String> androidSizesDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String size in sizesList) {
      var newItem = DropdownMenuItem(
        child: Text(size),
        value: size,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        onChanged: (size) {
          setState(() {
            selectSize = size;
          });
        },
        value: selectSize,
        items: dropDownItems);
  }

  DropdownButton<String> androidColorsDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String color in colorsList) {
      var newItem = DropdownMenuItem(
        child: Text(color),
        value: color,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        onChanged: (color) {
          setState(() {
            selectColor = color;
          });
        },
        value: selectColor,
        items: dropDownItems);
  }

  DropdownButton<String> androidQuantityDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String quantity in quantityList) {
      var newItem = DropdownMenuItem(
        child: Text(quantity),
        value: quantity,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        onChanged: (quantity) {
          setState(() {
            selectQuantity = quantity;
          });
        },
        value: selectQuantity,
        items: dropDownItems);
  }

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(product['name']),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName)),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: GridTile(
                  child: Container(
                    color: Colors.white,
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  footer: Container(
                    color: Colors.black12,
                    child: ListTile(
                      leading: Text(
                        product['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      title: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "${product['oldPrice']}\$",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              "${product['currentPrice']}\$",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Size',
                          ),
                          androidSizesDropDownButton(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Color'),
                          androidColorsDropDownButton(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FittedBox(child: Text('Quantity')),
                          androidQuantityDropDownButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          borderSide: BorderSide.none),
                      textColor: Colors.grey,
                      color: Colors.red,
                      elevation: 0.2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text(
                                'Buy now',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.red,
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.red,
                    icon: Icon(
                      Icons.add_shopping_cart,
                    ),
                  ),
                ]),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Product details',
                ),
                subtitle: Text(blazarDetail),
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                    child: Text(
                      'Product name :',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '${product['name']}',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                    child: Text(
                      'Product brand :',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    'brand X',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                    child: Text(
                      'Product condition :',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    'New',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Text(
                  'Similar products',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 320,
                child: SimilarProducts(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
