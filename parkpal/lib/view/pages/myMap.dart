import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late GoogleMapController mapController;

final LatLng _center = const LatLng(43.532723980199435, -80.22618390079778);

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}
Widget mapPage(){
  return Stack(children: [
          GoogleMap(
            onMapCreated: _onMapCreated, 
            initialCameraPosition: 
            CameraPosition(
              target: _center, 
              zoom:15.0
            ),
          ),
          Positioned(
            top:90,
            right:15,
            left:15,
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.all(Radius.circular(20))),
              child:
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "Search"
                      ),
                    ),
                  ), 
                ],
              )
            )
          )
        ],
      );
}

