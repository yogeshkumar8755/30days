import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vapp/cart_page.dart';
import 'package:vapp/login_page.dart';
import 'package:vapp/sign_up.dart';
import 'package:vapp/spalesh.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:vapp/util/route.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
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
      initialRoute: "/",

      routes: {
        "/": (context) => const SignUp(),
        MyRoute.homeRoute: (context) => const Home(),
        MyRoute.CartRoute: (context) => const CartPage()
      },
    );
  }
}
