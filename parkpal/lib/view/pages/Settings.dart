import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget settings() {
  return SafeArea(
      child: Column(
    children: [
      Container(
          child: Row(
        children: [
          Expanded(
              flex: 3,
              child: CircleAvatar(
                backgroundImage: AssetImage("asset/images/profile.png"),
                radius: 40,
              )),
          Expanded(
              flex: 7,
              child: Text(
                "John Doe",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ))
        ],
      )),
      Padding(padding: EdgeInsets.only(top: 20)),
      ListTile(
          title: Text("Privacy"),
          shape: Border(top: BorderSide(), bottom: BorderSide()),
          trailing: Icon(Icons.arrow_forward_ios)),
      ListTile(
          title: Text("Notifcations"),
          shape: Border(bottom: BorderSide()),
          trailing: Icon(Icons.arrow_forward_ios)),
      ListTile(
          title: Text("Password"),
          shape: Border(bottom: BorderSide()),
          trailing: Icon(Icons.arrow_forward_ios)),
      ListTile(
        title: Text("Account"),
        shape: Border(bottom: BorderSide()),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      TextButton(onPressed: () => FirebaseAuth.instance.signOut(), child: Text("logout"))
    ],
  ));
}
