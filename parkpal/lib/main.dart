import 'package:flutter/material.dart';
import './view/pages/BottomNav.dart';

void main() {
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
      home: BottomNav(),
    );
  }
}