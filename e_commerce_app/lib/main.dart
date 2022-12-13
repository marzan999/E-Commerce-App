import 'package:e_commerce_app/nav_bar/home_nav.dart';
import 'package:e_commerce_app/provider/catagory_provider.dart';
import 'package:e_commerce_app/provider/order_provider.dart';
import 'package:e_commerce_app/provider/product_page.dart';
import 'package:e_commerce_app/screens/auth/login_page.dart';
import 'package:e_commerce_app/screens/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
