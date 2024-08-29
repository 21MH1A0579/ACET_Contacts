
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';

class Hods_Screen extends StatelessWidget {
  const Hods_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "HOD'S",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("HOD'S").orderBy('Dept').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: primarycolor,));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: CircularProgressIndicator(color: primarycolor,));
          }
          final hods = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
          return ListView.builder(
            itemCount: hods.length,
            itemBuilder: (context, index) {
              final hod = hods[index];
              return Custom_ListItem(
                name: hod['EmployeeName']!,
                designation: "HOD - ${hod['Dept']}",
                ontap: () {
                  if (hod['Mobile.No'] != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileWidget(
                          name: hod['EmployeeName']!,
                          phonenumber1: hod['Mobile.No']!,
                          phonenumber2: '',
                          designation: hod['Designation']!,
                          email: hod['EmailId']!,
                          title: "HOD - ${hod['Dept']}",
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
