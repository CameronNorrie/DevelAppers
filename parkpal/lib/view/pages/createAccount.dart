import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'BottomNav.dart';


class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }
  Widget inputField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
          labelText: label,
          floatingLabelStyle: TextStyle(color: Colors.red)
        ),
      ),
    );
  }
  Future createFirebaseAccount() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    );
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 100.0, bottom: 15),
                child: Text("Park Pal", style: TextStyle(
                  fontSize: 40, 
                  fontWeight: FontWeight.w600
                )),
              ),
              inputField("Username",usernameController),
              inputField("Email",emailController),
              inputField("Password",passwordController),
              Padding(padding: const EdgeInsets.only(top: 10)),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    createFirebaseAccount();
                    FirebaseAuth.instance.userChanges().listen((User? user) {
                      if(user != null){
                        users.doc(user.uid).get().then((snapshot) => {
                          if(!snapshot.exists) {
                            users.doc(user.uid).set(
                              {
                                'username': usernameController.text,
                                'email': emailController.text,
                                'image': ""
                              }
                            )
                          }
                        });
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}