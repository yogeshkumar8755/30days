import 'dart:async';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vapp/core/const.dart';
import 'package:vapp/home.dart';

import 'login_page.dart';

class SpleshScrean extends ConsumerStatefulWidget {
  const SpleshScrean({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpleshScreanState();
}

class _SpleshScreanState extends ConsumerState<SpleshScrean> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // var sher = SharedPreferences.getInstance();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Laoding...",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPre = await SharedPreferences.getInstance();
    var storePref = sharedPre.getBool(Const.isLogin);
    var sto = sharedPre.getString(Const.userKey);

    Timer(Duration(seconds: 2), () {
      if (storePref != null && sto != null) {
        if (storePref) {
          if (kDebugMode) {
            print(["$sto loged in"]);
          }
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Home(sto)));
        } else {
          if (kDebugMode) {
            print(["plz loged in"]);
          }
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login()));
        }
      } else {
        if (kDebugMode) {
          print(["plz loged in"]);
        }
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }
}
