import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Text(
            "Create New Account",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Email")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("password")),
            ),
          ),
          OutlinedButton(onPressed: () {

            
          }, child: Text("Submit"))
        ],
      ),
    );
  }
}

