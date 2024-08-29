// import 'package:flutter/material.dart';
// import '../widgets/constants.dart';
// import '../widgets/custom_widgets.dart';
// import '../widgets/profile_widget.dart';
//
// class DeansScreen extends StatelessWidget {
//   const DeansScreen({Key? key}) : super(key: key);
//
//   final List<Map<String, String>> deansList = const [
//     {
//       "name": "Dr. Pullela S V V S R Kumar",
//       "designation": "Dean - Academics",
//       "phnumber1": "9848163227",
//       "phnumber2": "9951946669",
//       "email": "dean_ac@acet.ac.in"
//     },
//     {
//       "name": "Dr. Y.K.S. Subba Rao",
//       "designation": "Dean - Administration",
//       "phnumber1": "7396659639",
//       "phnumber2": "7959315140",
//       "email": "dean_ad@acet.ac.in"
//     },
//     {
//       "name": "Dr. Godla Sanjiv Rao",
//       "designation": "Dean - IQAC",
//       "phnumber1": "9848194619",
//       "phnumber2": "-",
//       "email": "dean_iqac@acet.ac.in"
//     },
//     {
//       "name": "Dr. Chaluvadi V Raghavendran",
//       "designation": "Dean - Research & Consultancy",
//       "phnumber1": "9440674553",
//       "phnumber2": "7095176663",
//       "email": "dean_rc@acet.ac.in"
//     },
//     {
//       "name": "Dr. K Manoz Kumar Reddy",
//       "designation": "Dean - Evaluation",
//       "phnumber1": "9949565980",
//       "phnumber2": "7842618666",
//       "email": "dean_ce@acet.ac.in"
//     },
//     {
//       "name": "Dr. D Kishore",
//       "designation": "Dean - Career Guidance",
//       "phnumber1": "9490873900",
//       "phnumber2": "7095176662",
//       "email": "dean_cg@acet.ac.in"
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         title: const Text(
//           "DEANS",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         backgroundColor: primarycolor,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             opacity: 0.2,
//             image: AssetImage('asserts/adityalogo.jpg'), // Replace with your image path
//             fit: BoxFit.fitWidth,
//           ),
//         ),
//         child: ListView.builder(
//           itemCount: deansList.length,
//           itemBuilder: (context, index) {
//             final dean = deansList[index];
//             return Custom_ListItem(
//               name: dean['name']!,
//               designation: dean['designation']!,
//               ontap: () {
//                 if (dean['phnumber1'] != '') {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ProfileWidget(
//                         name: dean['name']!,
//                         phonenumber1: dean['phnumber1']!,
//                         phonenumber2: dean['phnumber2']!,
//                         designation: dean['designation']!,
//                         email: dean['email']!,
//                         title: "DEANS",
//                       ),
//                     ),
//                   );
//                 }
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

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
