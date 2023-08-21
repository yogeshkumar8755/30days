import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vapp/api/Api.dart';
import 'package:vapp/util/route.dart';

class Login extends ConsumerWidget {
  Login({super.key});

  @override
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // final log = ref.watch(getUserProvider);
    String dat;

    moveToHome(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
        var share = await SharedPreferences.getInstance();
        share.setBool("key", true);
        // dat = share.setString("UserName", emailController.text) as String;
        // print(dat);

        Navigator.pushNamed(context, MyRoute.homeRoute);
      }
    }

    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "images/login_page.png",
                  fit: BoxFit.cover,
                  height: 210,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login Here ",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "enter user name",
                          labelText: "user name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "user name can not be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "password",
                          hintText: "enter password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password can not be empty";
                          } else if (value.length < 6) {
                            return "password minimum 6 no ka ho ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String userName = emailController.text;
                          String password = passwordController.text;

                          // fetchLoginApi(userName, password, BuildContext);

                          var sharedPre = await SharedPreferences.getInstance();
                          sharedPre.setBool('key', true);
                          var dat = sharedPre.setString('username', userName);
                          if (kDebugMode) {
                            print(dat);
                          }

                          moveToHome(context);
                        },
                        child: Text("login"),
                        style: TextButton.styleFrom(minimumSize: Size(90, 40)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
