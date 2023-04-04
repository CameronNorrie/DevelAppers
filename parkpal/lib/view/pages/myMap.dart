import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late GoogleMapController mapController;

const LatLng _center = LatLng(43.532723980199435, -80.22618390079778);

Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}

class myMap extends StatefulWidget {
  const myMap({super.key});

  @override
  State<myMap> createState() => _myMap();
}

class _myMap extends State<myMap> {

  Future _addMarkerLongPressed(LatLng latlang) async {
    setState(() {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      CollectionReference _history = FirebaseFirestore.instance.collection('history');
      final MarkerId markerId = MarkerId("RANDOM_ID");
      var now = DateTime.now().millisecondsSinceEpoch;
      Marker marker = Marker(
        markerId: markerId,
        draggable: true,
        position: latlang,
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          _history.doc(uid).update({
          'user_history': FieldValue.arrayUnion([now.toString()]) 
          });
        },
      );

      markers[markerId] = marker;

      showDialogWithFields(latlang, now, uid);
    });
  }


  void showDialogWithFields(LatLng latlang, int now, String ?uid) {
    showDialog(
      context: context,
      builder: (_) {
        var nameController = TextEditingController();
        var capacityController = TextEditingController();
        return AlertDialog(
          title: Text('Add new parking space'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextFormField(
                  controller: capacityController,
                  decoration: InputDecoration(hintText: 'Capacity'),
                ),
              ],
            )
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Send them to your email maybe?
                var name = nameController.text;
                var capacity = capacityController.text;
                CollectionReference _markers = FirebaseFirestore.instance.collection('markers');
                _markers.doc(now.toString()).set({
                  'name': nameController.text,
                  'capacity': capacityController.text,
                  'latitude': latlang.latitude,
                  'longitude': latlang.longitude,
                  'id': now.toString()
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
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
                ))),
      ],
    );
  }
}