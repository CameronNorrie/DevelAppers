import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(43.532723980199435, -80.22618390079778);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Park Pal"),
        backgroundColor: Colors.red[800],
      ),
      body: GoogleMap(onMapCreated: _onMapCreated, initialCameraPosition: CameraPosition(
        target: _center, 
        zoom:15.0),
      ),
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

