// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// final List<Map<String, dynamic>>Committee=[
// {
// "Committee_Name": "ACADEMIC COMMITTEE",
// "Coordinator1_Name": "Sri I. Narasimha Rao",
// "MobileNo1": 9885160468,
// "Coordinator2_Name": "Dr K Siva Satya Mohan ",
// "MobileNo2": 9618970423
// },
// {
// "Committee_Name": "ADMISSIONS COMMITTEE",
// "Coordinator1_Name": "Sri T. N. V. S. Ramachandran",
// "MobileNo1": 9949566059,
// "Coordinator2_Name": "G B Chandra Mouli",
// "MobileNo2": 9440494036
// },
// {
// "Committee_Name": "ALUMNI COMMITTEE",
// "Coordinator1_Name": "Ms Ch. Janaki Devi",
// "MobileNo1": 8008122280,
// "Coordinator2_Name": "SK Vahida",
// "MobileNo2": 9542478645
// },
// {
// "Committee_Name": "ANTI-RAGGING COMMITTEE",
// "Coordinator1_Name": "A Satyam",
// "MobileNo1": "9959818318 ",
// "Coordinator2_Name": "Mr I Ramesh Raja",
// "MobileNo2": 7729996263
// },
// {
// "Committee_Name": "CANTEEN COMMITTEE",
// "Coordinator1_Name": "Mr.S.Nagendra",
// "MobileNo1": 9951494832,
// "Coordinator2_Name": "Mr Digumarthi V Saradhi",
// "MobileNo2": 8309668713
// },
// {
// "Committee_Name": "CAREER GUIDANCE CELL",
// "Coordinator1_Name": "Sri B. Raghava Maheedhar",
// "MobileNo1": 8019184695,
// "Coordinator2_Name": "R Anil Kumar",
// "MobileNo2": 9701129137
// },
// {
// "Committee_Name": "CULTURAL COMMITTEE",
// "Coordinator1_Name": "Sri J. Bala Mohan Raju",
// "MobileNo1": 9866254569,
// "Coordinator2_Name": "T Neelima",
// "MobileNo2": 9963850771
// },
// {
// "Committee_Name": "ENTERPRENEURSHIP DEVELOPMENT (EDC)CELL",
// "Coordinator1_Name": "Mr. B.Jagadeesh Babu                                               ",
// "MobileNo1": 7893839001,
// "Coordinator2_Name": "Dr M Murugan",
// "MobileNo2": 7010989382
// },
// {
// "Committee_Name": "WEBSITE COMMITTEE",
// "Coordinator1_Name": "Sri V. Chandra Sekhara Rao",
// "MobileNo1": 9010987771,
// "Coordinator2_Name": "Mr Mohammad Amanulla",
// "MobileNo2": 9491221335
// },
// {
// "Committee_Name": "TRANSPORT COMMITTEE",
// "Coordinator1_Name": "Sri A. Hanumantha Rao",
// "MobileNo1": 9492144194,
// "Coordinator2_Name": "Dr Nakka Rajeswara Rao",
// "MobileNo2": 9701720827
// },
// {
// "Committee_Name": "NSS COMMITTEE",
// "Coordinator1_Name": "Sri M. Raghunath",
// "MobileNo1": 9640626333,
// "Coordinator2_Name": "Mr J Srinivasa Rao",
// "MobileNo2": 9885554253
// },
// {
// "Committee_Name": "INTERNAL QUALITY ASSURANCE CELL  (IQAC)",
// "Coordinator1_Name": "Sri D.V. Ravi Kumar                    ",
// "MobileNo1": 9912624422,
// "Coordinator2_Name": "Dr Ch V Raghavendran",
// "MobileNo2": 9440674553
// },
// {
// "Committee_Name": "R&D COMMITTEE",
// "Coordinator1_Name": "Dr. R. Raman",
// "MobileNo1": 9361886400,
// "Coordinator2_Name": "Dr R V S Lalitha",
// "MobileNo2": 8008379819
// },
// {
// "Committee_Name": "SPORTS & GAMES COMMITTEE",
// "Coordinator1_Name": "Sri N. Shankar",
// "MobileNo1": 9063311800,
// "Coordinator2_Name": "Mr George Fernandez Raj",
// "MobileNo2": 6380867204
// },
// {
// "Committee_Name": "STUDENTS COUNCIL",
// "Coordinator1_Name": "Ms B. Jyothi",
// "MobileNo1": 9441890729,
// "Coordinator2_Name": "M.P. Subbaraju",
// "MobileNo2": 9618018807
// },
// {
// "Committee_Name": "PLACEMENT & TRANING COMMITTEE",
// "Coordinator1_Name": "Mr K.Chandrasekhar",
// "MobileNo1": 9866095701,
// "Coordinator2_Name": "Mr G A Arun Kumar",
// "MobileNo2": 9494954969
// },
// {
// "Committee_Name": "PREVENTION OF SEXUAL HARASSMENT CELL & INTERNAL COMPLAINTS COMMITTEE (ICC)",
// "Coordinator1_Name": "Mrs. S. Swetha Radha",
// "MobileNo1": 9949485859,
// "Coordinator2_Name": "Mrs A Rama Vasantha",
// "MobileNo2": 9949974343
// },
// {
// "Committee_Name": "ECO CLUB",
// "Coordinator1_Name": "Sri U. Praveen Kumar",
// "MobileNo1": 9640381333,
// "Coordinator2_Name": "M Satish Kumar",
// "MobileNo2": 9441662969
// },
// {
// "Committee_Name": "HEALTH CLUB",
// "Coordinator1_Name": "Sri T. Lakshminarayana",
// "MobileNo1": 9010054544,
// "Coordinator2_Name": "V Rama Krishna",
// "MobileNo2": 9392285615
// },
// {
// "Committee_Name": "HOSTEL COMMITTEE",
// "Coordinator1_Name": "Ms.K.Himabindu",
// "MobileNo1": 9160813718,
// "Coordinator2_Name": "J Surendranath",
// "MobileNo2": 8099857780
// },
// {
// "Committee_Name": "WOMEN GRIEVANCES & EQUAL OPPORTUNITY CELL",
// "Coordinator1_Name": "Mrs  P.N.S. Lakshmi ",
// "MobileNo1": 9640381333,
// "Coordinator2_Name": "Varalakshmi",
// "MobileNo2": 9959170059
// },
// {
// "Committee_Name": "CENTRAL PURCHASE COMMITTEE ",
// "Coordinator1_Name": "Dr.B.V.Rama Krishna",
// "MobileNo1": 9849995798,
// "Coordinator2_Name": "Mr E Raghavendra Yadav",
// "MobileNo2": 9704226004
// },
// {
// "Committee_Name": "ETHICS COMMITTEE",
// "Coordinator1_Name": "Dr M.Rahula Bharati",
// "MobileNo1": 9786846841,
// "Coordinator2_Name": "R Srinivas",
// "MobileNo2": 7731078885
// },
// {
// "Committee_Name": "EXAMINATIONS AND MALPRACTICES COMMITTEE",
// "Coordinator1_Name": "Sri P. Raja Sekhar Reddy",
// "MobileNo1": 8885988111,
// "Coordinator2_Name": "Mr Ramesh nsvsc sripada",
// "MobileNo2": 8978615317
// },
// {
// "Committee_Name": "LIBRARY COMMITTEE",
// "Coordinator1_Name": "Dr G. Kiran Kumar",
// "MobileNo1": 9740251522,
// "Coordinator2_Name": "P S V Shanmukhi",
// "MobileNo2": 9059205666
// },
// {
// "Committee_Name": "MAGAZINE COMMITTEE",
// "Coordinator1_Name": "Dr N. Bhanu Teja,",
// "MobileNo1": 8903578086,
// "Coordinator2_Name": "K.L.V Prasad",
// "MobileNo2": 9963230878
// },
// {
// "Committee_Name": "INDUSTRY INSTITUTE PARTNERSHIP CELL (IIPC)",
// "Coordinator1_Name": "Ms K. Lakshmi",
// "MobileNo1": 9160077441,
// "Coordinator2_Name": "Mr Nadella Sunil",
// "MobileNo2": 9848325165
// },
// {
// "Committee_Name": "COUNSELLING COMMITTEE",
// "Coordinator1_Name": "Sri M.Satyanarayana Raju",
// "MobileNo1": 9618568023,
// "Coordinator2_Name": "Mr Abdul Arif",
// "MobileNo2": 7036358658
// }
// ];
// // Function to insert deansList into Firestore
// Future<void> insertIqacList() async {
//   final IqacCollection = FirebaseFirestore.instance.collection("Committee");
//
//   for (var iqac in Committee) {
//     await IqacCollection.doc(iqac['Committee_Name']).set({
//       "Committee_Name": iqac['Committee_Name'].trim(),
//       "Coordinator1_Name": iqac['Coordinator1_Name'].trim(),
//       "Coordinator2_Name": iqac['Coordinator2_Name'].trim(),
//       "MobileNo1": iqac['MobileNo1'].toString().trim(),
//       "MobileNo2": iqac['MobileNo2'].toString().trim(),
//     });
//   }
// }
