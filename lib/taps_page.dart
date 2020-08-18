import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fashinshop/drawer/all_products.dart';
import 'components/constants.dart';
import 'drawer/favorites_page.dart';
import 'drawer/shop_drawer.dart';
import 'home/home_page.dart';

class TapsPage extends StatefulWidget {
  static const routeName = '/taps-page';
  @override
  _TapsPageState createState() => _TapsPageState();
}

class _TapsPageState extends State<TapsPage> {
  int _selectPageIndex = 0;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
      },
      {
        'page': FavoritesPage(),
      },
      {
        'page': AllProducts(),
      },
    ];
    super.initState();
  }

  Future<bool> _onWillPop() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return showExitConfirmationDialog(context);
    } else {
      return showExitConfirmationDialog(context);
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: ShopDrawer(),
        body: _pages[_selectPageIndex]['page'],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(33),
          ),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            backgroundColor: Colors.black87,
            currentIndex: _selectPageIndex,
//          type: BottomNavigationBarType.shifting,
            selectedFontSize: 17,
            onTap: _selectPage,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.only(top: 0.8),
                    child: const Icon(Icons.home)),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite),
                  icon: Padding(
                    padding: EdgeInsets.only(top: 0.8),
                    child: Icon(Icons.favorite_border),
                  ),
                  title: Text(
                    'Favorite',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0.8),
                  child: const Icon(Icons.border_all),
                ),
                title: Text(
                  'All product',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
