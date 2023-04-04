import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'myMap.dart';
import 'Settings.dart';
import 'History.dart';
class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int selectedIndex = 1;
  final List<Widget> pages = [History(), myMap(), Settings()];
  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Park Pal"),
      //   backgroundColor: Colors.red[800],
      // ),
      body:  pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

