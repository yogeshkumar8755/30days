import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vapp/api/Api.dart';
import 'package:vapp/core/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    var nameController = TextEditingController();
    var ratingController = TextEditingController();
    var tagsController = TextEditingController();
    var priceController = TextEditingController();
    var sizeController = TextEditingController();
    var colorController = TextEditingController();
    var descriptionController = TextEditingController();
    var imageController = TextEditingController();
    // var dbRef = FirebaseDatabase.instance.ref("Post");

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Name")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ratingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("rating")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: tagsController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("tag")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: sizeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("size")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("price")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: colorController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("color")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("description")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: imageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text(" image")),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  // dbRef
                  //     .child(DateTime.now().millisecondsSinceEpoch.toString())
                  //     .set({
                  //   "PName": pNameController.text,
                  //   "Pdesc": pDescController.text,
                  //   "PMore": pMoreController.text,
                  //   'PHor': pHorController.text
                  // });
                  ref.read(ApiProvider).postData(
                      nameController.text.trim(),
                      ratingController.text.trim(),
                      priceController.text.trim(),
                      tagsController.text.trim(),
                      sizeController.text.trim(),
                      colorController.text.trim(),
                      descriptionController.text.trim(),
                      imageController.text.trim());
                  Utiss().flutterMsg("done");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (c) => Home(nameController.text)));
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
