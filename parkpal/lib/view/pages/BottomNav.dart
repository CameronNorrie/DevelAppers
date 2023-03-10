import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Park Pal"),
        backgroundColor: Colors.red[800],
      ),
      body: Text("PARK PAL", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600) ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Scheduled",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Attractions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Scheduled",
          ),
        ],
        selectedItemColor: Colors.red[800],
      ),
    );
  }
}

