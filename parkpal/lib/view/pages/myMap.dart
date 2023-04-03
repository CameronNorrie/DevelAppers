import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late GoogleMapController mapController;

const LatLng _center = LatLng(43.532723980199435, -80.22618390079778);

Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}

class myMap extends StatefulWidget {
  const myMap({super.key});

  @override
  State<myMap> createState() => _myMapState();
}

class _myMapState extends State<myMap> {
  Future _addMarkerLongPressed(LatLng latlang) async {
    setState(() {
      final MarkerId markerId = MarkerId("RANDOM_ID");
      Marker marker = Marker(
        markerId: markerId,
        draggable: true,
        position: latlang,
        icon: BitmapDescriptor.defaultMarker,
      );

      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
          onLongPress: (latlang) {
            _addMarkerLongPressed(latlang);
          },
          markers: Set<Marker>.of(markers.values),
        ),
        Positioned(
            top: 90,
            right: 15,
            left: 15,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: "Search"),
                      ),
                    ),
                  ],
                )))
      ],
    );
  }
}