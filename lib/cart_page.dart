import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        title: Text("Cart"),
        centerTitle: true,
      ),
    );
  }
}