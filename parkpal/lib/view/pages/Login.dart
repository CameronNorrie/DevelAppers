import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BottomNav.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    labelText: 'Email',
                    floatingLabelStyle: TextStyle(color: Colors.red)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                    labelText: 'Password',
                    floatingLabelStyle: TextStyle(color: Colors.red)
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ),
                        Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => BottomNav()));
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
              Text('New User? Create Account')
          ],
        ),
      )),
    );
  }
}

