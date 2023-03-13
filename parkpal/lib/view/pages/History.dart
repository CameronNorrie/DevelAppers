import 'package:flutter/material.dart';


Widget history(){
  return Center(
    child: SingleChildScrollView( child: Column( 
      children: [
        Text(
          "Past Spots",
          style: TextStyle(
          color: Colors.white,
          fontSize: 60,
          ),
      textAlign: TextAlign.start,
    ),
      ListView(
        children: [
          ListTile(
              leading: Image.network(
                "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/intTFNX2AHxk/v0/-1x-1.jpg",
                height: 40,
                width: 70,
                fit: BoxFit.fill
                ),
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
                fit: BoxFit.fill
                ),
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
        )
      ],
      )
    )
      );
}