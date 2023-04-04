import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    CollectionReference history =
        FirebaseFirestore.instance.collection("history");
    List<String> markerIDs;
    history.doc(uid).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      setState(() {
        markerIDs = data["user_history"];
      });
    });

    Stream<DocumentSnapshot> recordStream =
        FirebaseFirestore.instance.collection('history').doc(uid).snapshots();

    return SingleChildScrollView(
        child: Column(
      children: [
        SafeArea(
            child: Text(
          "Past Spots",
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
            fontSize: 40,
          ),
          textAlign: TextAlign.left,
        )),
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ListTile(
              leading: Image.network(
                  "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/intTFNX2AHxk/v0/-1x-1.jpg",
                  height: 40,
                  width: 70,
                  fit: BoxFit.fill),
              title: Text(
                'Walmart Plaza',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(text: '1km | 20% | '),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(Icons.arrow_upward_rounded),
                      ),
                    ),
                    TextSpan(text: '450'),
                  ],
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Image.network(
                  "https://www.kai-pavement.com/files/img_84461319227780.jpg",
                  height: 40,
                  width: 70,
                  fit: BoxFit.fill),
              title: Text(
                'Arboretum',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(text: '500m | 80% | '),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(Icons.arrow_upward_rounded),
                      ),
                    ),
                    TextSpan(text: '60'),
                  ],
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
        ListView(
          children: [],
        )
        // StreamBuilder(
        //     stream: recordStream,
        //     builder: (BuildContext context,
        //         AsyncSnapshot<DocumentSnapshot> snapshot) {
        //       if (snapshot.hasError) {
        //         return Text("Something went wrong");
        //       }
        //       if (snapshot.hasData) {
        //         if (snapshot.data!.length == 0) {
        //           return Center(
        //             child: Text(
        //               "No Journal Enteries Made",
        //               style: TextStyle(
        //                 fontSize: 30,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           );
        //         }
        //       }
        //     })
      ],
    ));
  }
}
