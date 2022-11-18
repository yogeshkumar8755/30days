import 'package:flutter/material.dart';
import 'package:vapp/cart_page.dart';
import 'package:vapp/login_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:vapp/util/route.dart';

import 'home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
      ),
      // home: const Home(),
      initialRoute: MyRoute.homeRoute,

      routes: {
        "/":(context) => const Login(),
          MyRoute.homeRoute:(context) => const Home(),
          MyRoute.CartRoute:(context) => const CartPage()
      },
    );
  }
}

