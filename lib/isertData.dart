import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vapp/core/utils.dart';
import 'package:vapp/home.dart';

class InsertData extends ConsumerStatefulWidget {
  const InsertData({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InsertDataState();
}

class _InsertDataState extends ConsumerState<InsertData> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    var pNameController = TextEditingController();
    var pDescController = TextEditingController();
    var pMoreController = TextEditingController();
    var pHorController = TextEditingController();
    var dbRef = FirebaseDatabase.instance.ref("Post");

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Product Name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pDescController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Product desc")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pMoreController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Product more")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pHorController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Product hor")),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                dbRef
                    .child(DateTime.now().millisecondsSinceEpoch.toString())
                    .set({
                  "PName": pNameController.text,
                  "Pdesc": pDescController.text,
                  "PMore": pMoreController.text,
                  'PHor': pHorController.text
                });
                Utiss().flutterMsg("done");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => Home(pHorController.text)));
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
