import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/nav_bar/catagory_page.dart';
import 'package:e_commerce_app/nav_bar/order_page.dart';
import 'package:e_commerce_app/nav_bar/product_page.dart';
import 'package:e_commerce_app/nav_bar/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  final myPages = [
    OrderPage(),
    CategoryPage(),
    ProductPage(),
    ProfilePage(),
  ];
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myPages[indexPage],
      bottomNavigationBar: CurvedNavigationBar(
        // items: [
        //   Icon(Icons.list, size: 30),
        //   Icon(Icons.favorite_border, size: 30),
        //   Icon(Icons.photo_album, size: 30),
        //   Icon(Icons.photo_album, size: 30),
        // ],

        index: 0,
        height: 60.0,
        items: <Widget>[
          // Text('Order'),
          // Text('Profile'),
          // Text('Product'),
          // Text('Catagory'),
          Icon(Icons.note_add, size: 30),
          Icon(Icons.list_alt, size: 30),
          Icon(Icons.computer_outlined, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Color.fromARGB(255, 215, 218, 217),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 105, 153, 148),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            indexPage = index;
          });
        },
      ),
    );
  }
}
