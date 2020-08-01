import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/home_page.dart';
import '../home/products_grid.dart';
import '../provider/products.dart';
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
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productsData = Provider.of<Products>(context);
    final loadedProduct = productsData.findById(productId);
    final productCategory = loadedProduct.category;
    final productList = productsData.productsList;
    final productsFilterd = productList.where((product) {
      return product.category.contains(productCategory);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(loadedProduct.name),
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
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
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
                      loadedProduct.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: Container(
                    color: Colors.black54,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                loadedProduct.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "${loadedProduct.oldPrice}",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red,
                                      decorationThickness: 3,
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'LL',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                      ))
                                ]),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "${loadedProduct.currentPrice}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'LL',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                      ))
                                ]),
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
                    onPressed: () {
                      setState(() {
                        loadedProduct.toggleFavoriteStatus();
                      });
                    },
                    color: Colors.red,
                    icon: Icon(
                      loadedProduct.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      productsData.addCart(
                          loadedProduct.id,
                          loadedProduct.currentPrice,
                          loadedProduct.image,
                          loadedProduct.name);
                    },
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
                subtitle: Text(loadedProduct.descreption),
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
                    '${loadedProduct.name}',
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
                height: 500,
                child: ProductsGrid(productsFilterd),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
