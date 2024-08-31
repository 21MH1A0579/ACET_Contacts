import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';

class DeansScreen extends StatelessWidget {
  const DeansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "DEANS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('deans').orderBy('position').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: primarycolor,));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: CircularProgressIndicator(color: primarycolor,));
          }
          final deans = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
          return ListView.builder(
            itemCount: deans.length,
            itemBuilder: (context, index) {
              final dean = deans[index];
              return Custom_ListItem(
                name: dean['name']!,
                designation: dean['designation']!,
                ontap: () {
                  if (dean['phnumber1'] != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileWidget(
                          name: dean['name']!,
                          phonenumber1: dean['phnumber1']!,
                          phonenumber2: dean['phnumber2']!,
                          designation: dean['designation']!,
                          email: dean['email']!,
                          title: "DEANS",
                        ),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
