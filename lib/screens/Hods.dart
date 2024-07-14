
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.2,
            image: AssetImage('asserts/adityalogo.jpg'), // Replace with your image path
            fit: BoxFit.fitWidth,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('HOD').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No HODs Found'));
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
      ),
    );
  }
}
