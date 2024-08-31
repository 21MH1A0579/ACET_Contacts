import 'dart:io';

import 'package:aditya_contacts/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
void insert_principal_data()
{
       final CollectionReference _principalref=FirebaseFirestore.instance.collection("imagedata");
       final data={
         "empid":"principal",
         "imgurl":"https://firebasestorage.googleapis.com/v0/b/aditya-ff271.appspot.com/o/principal%2Fprincipal.jpg?alt=media&token=beaa5ad1-7068-4c8f-a87e-5a06f4fb8997",
         "imagepath":"principal/principal.jpg",
       };
       final res=_principalref.doc("principal").set(data);
       print(res.asStream());

}

// Future<void> insertprincipalpic  ()
// async {
// final storageref= await FirebaseStorage.instance.ref().child("principal").child("principal.jpg");
//
//    File ? _pickedimg;
//    UserImagePicker(onPickImage: (File pickedImage) {
//      _pickedimg=pickedImage;
//    },);
//   await storageref.putFile(_pickedimg!);
//   final imageurl=await storageref.getDownloadURL();
//   print(imageurl);
//
// }