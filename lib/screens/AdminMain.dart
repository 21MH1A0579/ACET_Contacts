import 'dart:io';
import 'package:aditya_contacts/widgets/user_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    File? pickedImg;

    Future<void> insertPrincipalPic() async {
      try {
        // Initialize Firebase if not already initialized (depends on how you've structured your app)
        await Firebase.initializeApp(); // Ensure Firebase is initialized

        // Specify the storage bucket manually if needed
        FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://aditya-ff271.appspot.com');
        final storageRef = storage.ref().child("principal").child("principal.jpg");

        print("No image selected.");
        return;
      
        // Upload the image file
      } catch (e) {
        print('Failed to upload image: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ADMIN MAIN PAGE"),
      ),
      body: Row(
        children: [
          Center(
            child: UserImagePicker(
              onPickImage: (pickedImg) {
                pickedImg = pickedImg;
                print(pickedImg.path);
              }, bgimg: false,
            ),
          ),
          IconButton(
            onPressed: () async {
              await insertPrincipalPic();
            },
            icon: const Icon(Icons.save, size: 55),
          ),
        ],
      ),
    );
  }
}
