import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class Account extends StatefulWidget{
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String imageUrl ='';
  String lastImage ="";
  String email = "";
  String lastUsername = "";
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final usernameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(child:Text("Account", style: TextStyle(fontSize: 40))),
              Container(
                padding: EdgeInsets.only(top:80),
                child: Column(
                  children: [
                    Text("Username"),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black),),
                        floatingLabelStyle: TextStyle(color: Colors.red)
                      ),
                    )
                  ],
                )
              ),
              Container(
                padding: EdgeInsets.only(top:20),
                child: Column(
                  children: [
                    Text("Profile Picture"),
                    IconButton(
                      icon: Icon(Icons.abc_sharp), 
                      onPressed: () async {
                        ImagePicker imagePicker=ImagePicker();
                        XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                        if(file == null) return;
                        String uniqueFile = DateTime.now().millisecondsSinceEpoch.toString();
                        Reference root = FirebaseStorage.instance.ref();
                        Reference images = root.child('images');
                        Reference referenceImage = images.child(uniqueFile);
                        try{
                          await referenceImage.putFile(File(file.path));
                          imageUrl = await referenceImage.getDownloadURL();
                        }catch(error){
                          print(error);
                        }
                        
                      }
                      
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        print(imageUrl);
                        await users.doc(uid).get().then(
                          (DocumentSnapshot doc) {
                            final data = doc.data() as Map<String, dynamic>;
                            setState((){
                              lastUsername = data['username'];
                              lastImage = data['image'];
                              email = data['email'];
                            });
                          }
                        );
                        Map<String, String> dataToSend;
                        if(imageUrl.isEmpty && usernameController.text == ""){
                          dataToSend = {
                            'username': lastUsername,
                            'email': email,
                            'image': lastImage
                          }; 
                        }
                        else if(usernameController.text == ""){
                          dataToSend = {
                            'username': lastUsername,
                            'email': email,
                            'image': imageUrl
                          };
                        }
                        else if(imageUrl.isEmpty){
                          dataToSend = {
                            'username': usernameController.text,
                            'email': email,
                            'image': lastImage
                          }; 
                        }
                        else{
                          dataToSend = {
                            'username': usernameController.text,
                            'email': email,
                            'image': imageUrl
                          };
                        }
                        await users.doc(uid).update(dataToSend);
                        Navigator.pop(context,"test");
                      }, 
                      child: Text("Save Changes")
                      
                    )
                  ],
                )
              )
            ]
          ),
        )
      )
    );
  }
}

