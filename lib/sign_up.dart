import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vapp/login_page.dart';

import 'home.dart';

class SignUp extends ConsumerWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final auth = FirebaseAuth.instance;

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
          OutlinedButton(
              onPressed: () async {
                auth
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((value) {
                  if (value != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Home(value.user!.email.toString())));
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Login()));
                  }
                }).onError((error, stackTrace) => null);
                // await auth
                //     .createUserWithEmailAndPassword(
                //         email: emailController.text,
                //         password: passwordController.text.toString())
                //     .then((value) {})
                //     .onError((error, stackTrace) {
                //   Fluttertoast.showToast(msg: error.toString());
                // });
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}

// class firebaseAuth {
//   final _auth = FirebaseAuth.instance;

//   late List<User?> firebaseUser;
//   Future signUpWithFi() async {
//     try {
//       var result = await _auth.signInAnonymously();
//       firebaseUser = result.user as List<User?>;
//       return firebaseUser;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
