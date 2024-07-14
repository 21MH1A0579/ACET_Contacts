import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:aditya_contacts/widgets/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';

class Iqac_Screen extends StatelessWidget {
  const Iqac_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "IQAC",
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
          stream: FirebaseFirestore.instance.collection('IQAC').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No IQAC members found'));
            }
            final iqacList = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
            return ListView.builder(
              itemCount: iqacList.length,
              itemBuilder: (context, index) {
                final iqac = iqacList[index];
                return Custom_ListItem(
                  name: iqac['Employee.name'] ?? 'N/A',
                  designation: "IQAC - ${iqac['Dept'] ?? 'N/A'}",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileWidget(
                          name: iqac['Employee.name'] ?? 'N/A',
                          phonenumber1: iqac['Number']?.toString() ?? 'N/A',
                          phonenumber2: '',
                          designation: '---',
                          email: iqac['Email.Id'] ?? 'N/A',
                          title: "IQAC - ${iqac['Dept'] ?? 'N/A'}",
                        ),
                      ),
                    );
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
