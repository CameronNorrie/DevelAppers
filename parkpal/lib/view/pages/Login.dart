import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BottomNav.dart';
import 'createAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    );
  }
  Widget login(String text, TextEditingController controller){
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    labelText: text,
                    floatingLabelStyle: TextStyle(color: Colors.red)
                  ),
                ),
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
              Padding(padding: const EdgeInsets.only(top: 100.0),
                child: Text("Park Pal", style: TextStyle(
                  fontSize: 40, 
                  fontWeight: FontWeight.w600
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                  child: Center(
                  child: Container(
                      width: 200,
                      child: Image.asset('asset/images/car.gif')),
                ),
              ),
              login("Email", emailController),
              login("Password", passwordController),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    signIn();
                    //Navigator.push(
                     //   context, MaterialPageRoute(builder: (_) => BottomNav()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CreateAccount()));
                },
                child: Text(
                  'New User? Create Account',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
          ],
        ),
      )),
    );
  }
}

