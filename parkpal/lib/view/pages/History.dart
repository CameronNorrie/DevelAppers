import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final uid = FirebaseAuth.instance.currentUser?.uid;
    CollectionReference markers = FirebaseFirestore.instance.collection('markers');

  Stream buildFromFireStore(List<dynamic> ids){
    return FirebaseFirestore.instance.collection('markers').where(FieldPath.documentId, whereIn: ids).snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Text("Past Spots",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 40,
              ),
              textAlign: TextAlign.left,
            )),
          FutureBuilder(
            future: FirebaseFirestore.instance.collection('history').doc(uid).get(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              List<dynamic> markerIds = snapshot.data!['user_history'];
              return StreamBuilder(
                stream: buildFromFireStore(markerIds),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      var currentDoc = snapshot.data.docs[index];
                      return ListTile(
                        title: Text("${currentDoc['name']}", style: TextStyle(fontSize: 30),)
                      );
                    },
                   
                  );
                }
              );
            }
          )
        ],
      ),
    ); 
  }
}

/*print(markerIDs);

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
        // ListView(
        //   children: [],
        // )
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
    ));*/