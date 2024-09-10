//
// import 'package:cloud_firestore/cloud_firestore.dart';
// void insert_principal_data()
// {
//        final CollectionReference principalref=FirebaseFirestore.instance.collection("imagedata");
//        final data={
//          "empid":"principal",
//          "imgurl":"https://firebasestorage.googleapis.com/v0/b/aditya-ff271.appspot.com/o/principal%2Fprincipal.jpg?alt=media&token=beaa5ad1-7068-4c8f-a87e-5a06f4fb8997",
//          "imagepath":"principal/principal.jpg",
//        };
//        final res=principalref.doc("principal").set(data);
//        print(res.asStream());
//
// }
//
// // Future<void> insertprincipalpic  ()
// // async {
// // final storageref= await FirebaseStorage.instance.ref().child("principal").child("principal.jpg");
// //
// //    File ? _pickedimg;
// //    UserImagePicker(onPickImage: (File pickedImage) {
// //      _pickedimg=pickedImage;
// //    },);
// //   await storageref.putFile(_pickedimg!);
// //   final imageurl=await storageref.getDownloadURL();
// //   print(imageurl);
// //
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class AddContactButton extends StatelessWidget {
  final String phoneNumber;
  final String name;

  const AddContactButton(
      {required this.phoneNumber, required this.name, Key? key})
      : super(key: key);

  Future<void> _addOrEditContact(BuildContext context) async {
    // Request permission
    PermissionStatus permission = await Permission.contacts.request();

    if (permission.isGranted) {
      // Open the contact editor
      Contact contact = Contact(
        givenName: name,
        phones: [Item(label: "mobile", value: phoneNumber)],
      );

      try {
        // Check if contact exists and update or save new contact
        await ContactsService.openExistingContact(contact)
            .catchError((error) async {
          await ContactsService.addContact(contact);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contact added successfully!')),
          );
        });
      } catch (e) {
        // Handle any error during the process
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add contact.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contacts permission denied')),
      );
    }
  }

  Future<void> showContactBottomSheet(BuildContext context) async {
    final contacts = await ContactsService.getContacts();

    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = contacts[index];
            return ListTile(
              title: Text(contacts[index].displayName ?? ''),
              onTap: () {
                // Add the new contact to the existing contact
                ContactsService.addContact(contact);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person_add_alt_1_rounded),
      onPressed: () {
        _addOrEditContact(context);
        showContactBottomSheet(context);
      },
    );
  }
}
