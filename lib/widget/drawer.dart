// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

final ImageURL ="https://media.istockphoto.com/id/470100848/vector/male-profile-icon-white-on-the-blue-background.jpg?s=1024x1024&w=is&k=20&c=sawh7MhVFsl__2Bb5wAE317Pss1Vkd8843fbBcihkWA=";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueAccent,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            DrawerHeader(
              
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
              accountName:Text("yogesh kumar") ,
               accountEmail: Text("yogeshshar179@gmail.com"),
               currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("$ImageURL"),)
               ),),

               ListTile(
                 leading: Icon(Icons.home),
                iconColor: Colors.white,
                title: Text("Home",
                style: TextStyle(color: Colors.white),),
               ),
                ListTile(
                leading: Icon(Icons.mail),
                iconColor: Colors.white,
                title: Text("Mail",
                style: TextStyle(color: Colors.white),),
               ),
                ListTile(
                leading: Icon(Icons.settings),
                iconColor: Colors.white,
                title: Text("Setting",
                style: TextStyle(color: Colors.white),),
               )
          ],
        ),
      ),
    );
  }
}