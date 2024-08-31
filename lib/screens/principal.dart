import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/constants.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  Map<String, dynamic>? textdata;
  Map<String, dynamic>? imgdata;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    GetPrincipalData();
  }

  Future<void> GetPrincipalData() async {
    try {
      DocumentSnapshot snapshot1 = await FirebaseFirestore.instance
          .collection("principal")
          .doc("principal")
          .get();
      DocumentSnapshot snapshot2 = await FirebaseFirestore.instance
          .collection("imagedata")
          .doc("principal")
          .get();

      if (snapshot1.exists) {
        setState(() {
          textdata = snapshot1.data() as Map<String, dynamic>?;
        });
      } else {
        print("No data found in 'principal' document.");
      }

      if (snapshot2.exists) {
        setState(() {
          imgdata = snapshot2.data() as Map<String, dynamic>?;
        });
      } else {
        print("No data found in 'imagedata' document.");
      }
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      setState(() {
        isLoading = false; // Set loading to false when data fetching is complete
      });
    }
  }

  Future<void> _makeUricall(String scheme, String address) async {
    final Uri launchUri = Uri(
      scheme: scheme,
      path: address,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $address';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "PRINCIPAL",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: primarycolor,))
          : SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (imgdata != null)
                        ClipOval(
                          child: CircleAvatar(
                            radius: isPortrait ? size.width / 3.17 : size.width * 0.15,
                            backgroundColor: Colors.orange.shade500,
                            //backgroundImage: AssetImage("assets/no_image.png"),
                            child: Image.network(
                              imgdata?['imgurl'] ?? '',
                              errorBuilder: (context, error, stackTrace) => Image.asset('assets/no_image.png'),
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) {
                                  return child;
                                } else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                        ),
                      if (textdata != null) ...[
                        Text(
                          textdata!['EmployeeName'] ?? 'No Name',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          textdata!['Designation'] ?? 'No Designation',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "ADITYA COLLEGE OF ENGINEERING & TECHNOLOGY",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ]
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Custom_IconButton(icon: Icons.star_border, function: () {}),
                Custom_IconButton(icon: Icons.edit, function: () => {}),
                Custom_IconButton(icon: Icons.person_add_alt, function: () => {}),
              ],
            ),
            const Divider(),
            if (textdata != null)
              ListTile(
                leading: Custom_IconButton(
                  icon: Icons.message_outlined,
                  function: () => _makeUricall('sms', textdata!['MobileNo'] ?? ''),
                ),
                title: Text(
                  textdata!['MobileNo'] ?? 'No Mobile No',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                trailing: Custom_IconButton(
                  icon: Icons.phone,
                  function: () => _makeUricall('tel', textdata!['MobileNo'] ?? ''),
                ),
              ),
            const Divider(),
            if (textdata != null)
              ListTile(
                leading: Text("Email", style: TextStyle(fontSize: 20, color: primarycolor)),
                title: Text(
                  textdata!['EmailId'] ?? 'No Email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                trailing: Custom_IconButton(
                  icon: Icons.email_outlined,
                  function: () => _makeUricall('mailto', textdata!['EmailId'] ?? ''),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
