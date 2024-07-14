
import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/constants.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  Future<void> _makeUricall(String scheme, String address,) async {
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

  Future<void> _addContact(String phoneNumber) async {
    final Uri uri = Uri(
      scheme: 'content',
      path: 'addcontact',
      queryParameters: {
        'phone': phoneNumber,
      },
    );

    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String phonenumber = "+91 9000476662";
    const String email = "principal@acet.ac.in";

    // Get the size of the screen
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
      body: SingleChildScrollView(
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
                      ClipOval(
                        child: CircleAvatar(
                          radius: isPortrait ? size.width/3.17 : size.width * 0.15,
                          backgroundColor: Colors.orange.shade500,
                          child: Image.asset("asserts/principal.jpg"),
                        ),
                      ),
                      const Text(
                        "DR A RAMESH",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const Text(
                        "PRINCIPAL",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text(
                        "ADITYA COLLEGE OF ENGINEERING & TECHNOLOGY",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
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
                Custom_IconButton(icon: Icons.person_add_alt, function: () async {
                  await _addContact(phonenumber);
                }),
              ],
            ),
            const Divider(),
            ListTile(
              leading: Custom_IconButton(icon: Icons.message_outlined, function: () => _makeUricall('sms', phonenumber)),
              title: const Text(phonenumber, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              trailing: Custom_IconButton(icon: Icons.phone, function: () => _makeUricall('tel', phonenumber)),
            ),
            const Divider(),
            ListTile(
              leading: Text("Email", style: TextStyle(fontSize: 20, color: primarycolor)),
              title: const Text(email, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              trailing: Custom_IconButton(icon: Icons.email_outlined, function: () => _makeUricall('mailto', email)),
            )
          ],
        ),
      ),
    );
  }
}
