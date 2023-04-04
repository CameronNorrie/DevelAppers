import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'account.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}


class _SettingsState extends State<Settings> {
  String username = "";
  @override
  void initState(){
    super.initState();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    
    DocumentReference thisUser = FirebaseFirestore.instance.collection('users').doc(uid);
    thisUser.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          username = data['username'];
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
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
                username,
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
        trailing: IconButton(icon:Icon(Icons.arrow_forward_ios), onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => Account())
          );
        },),
      ),
      TextButton(onPressed: () => FirebaseAuth.instance.signOut(), child: Text("logout"))
    ],
  ));
  }
}