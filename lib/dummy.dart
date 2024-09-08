
import 'package:cloud_firestore/cloud_firestore.dart';
void insert_principal_data()
{
       final CollectionReference principalref=FirebaseFirestore.instance.collection("imagedata");
       final data={
         "empid":"principal",
         "imgurl":"https://firebasestorage.googleapis.com/v0/b/aditya-ff271.appspot.com/o/principal%2Fprincipal.jpg?alt=media&token=beaa5ad1-7068-4c8f-a87e-5a06f4fb8997",
         "imagepath":"principal/principal.jpg",
       };
       final res=principalref.doc("principal").set(data);
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