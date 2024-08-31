import 'dart:io';
import 'package:aditya_contacts/widgets/user_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    File? _pickedImg;

    Future<void> insertPrincipalPic() async {
      try {
        // Initialize Firebase if not already initialized (depends on how you've structured your app)
        await Firebase.initializeApp(); // Ensure Firebase is initialized

        // Specify the storage bucket manually if needed
        FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://aditya-ff271.appspot.com');
        final storageRef = storage.ref().child("principal").child("principal.jpg");

        if (_pickedImg == null) {
          print("No image selected.");
          return;
        }

        // Upload the image file
        await storageRef.putFile(_pickedImg!);
        final imageUrl = await storageRef.getDownloadURL();
        print('Image uploaded successfully. URL: $imageUrl');
      } catch (e) {
        print('Failed to upload image: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("ADMIN MAIN PAGE"),
      ),
      body: Row(
        children: [
          Center(
            child: UserImagePicker(
              onPickImage: (pickedImg) {
                _pickedImg = pickedImg;
                print(pickedImg.path);
              },
            ),
          ),
          IconButton(
            onPressed: () async {
              await insertPrincipalPic();
            },
            icon: Icon(Icons.save, size: 55),
          ),
        ],
      ),
    );
  }
}
