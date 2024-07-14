
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';

class Committee_Screen extends StatelessWidget {
  const Committee_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "COMMITTEE'S",
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
          stream: FirebaseFirestore.instance.collection('Committee').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Committees Data Found'));
            }
            final committees = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
            return ListView.builder(
              itemCount: committees.length,
              itemBuilder: (context, index) {
                final committee = committees[index];
                return Custom_DepartMentItem(name: committee["Committee_Name"], ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Committee_ProfileWidget(phonenumber1: committee['MobileNo1'], phonenumber2: committee['MobileNo2'], name1: committee['Coordinator1_Name'], name2: committee['Coordinator2_Name'], committe_name: committee['Committee_Name'])));
                });
              },
            );
          },
        ),
      ),
    );
  }
}
