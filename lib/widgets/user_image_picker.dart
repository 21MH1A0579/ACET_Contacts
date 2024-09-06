import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
   final bool? bgimg;
  final DocumentSnapshot<Object?>? imgdata;
  const UserImagePicker({super.key, required this.onPickImage, required this.bgimg, this.imgdata});

  final void Function(File pickedImage) onPickImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.grey,
          foregroundImage: _pickedImageFile != null
              ? FileImage(_pickedImageFile!)
              : (widget.bgimg == true
              ? widget.imgdata != null
              ? NetworkImage(widget.imgdata!['imgurl'])
              : AssetImage("asserts/no_image.png") as ImageProvider
              : AssetImage("asserts/no_image.png")),
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image, color: Colors.purple),
          label: widget.bgimg==true?Text(
    'Update Image',
    style: TextStyle(
      fontSize: 18,
    color: Colors.purple,
    ),
    ):Text(
            'Add Image',
            style: TextStyle(
              color: Colors.purple,
            ),
          ),
        ),
      ],
    );
  }

}
