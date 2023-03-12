import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './view/pages/BottomNav.dart';
import './view/pages/Login.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Park Pal",
      theme: ThemeData(
      primarySwatch: Colors.red,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
      ),
    ),
      home: Login(),
    );
  }
}