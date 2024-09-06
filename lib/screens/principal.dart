// principal_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/constants.dart';
import '../provider/provider.dart'; // Adjust the path as needed

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "PRINCIPAL",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Consumer<PrincipalDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
                child: CircularProgressIndicator(color: primarycolor));
          } else {
            return SingleChildScrollView(
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
                            if (provider.imgData != null)
                              ClipOval(
                                child: CircleAvatar(
                                  radius: isPortrait
                                      ? size.width / 5
                                      : size.width * 0.15,
                                  backgroundColor: Colors.orange.shade500,
                                  child: Image.network(
                                    fit: BoxFit.values[0],
                                    provider.imgData?['imgurl'] ?? '',
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/no_image.png',
                                    ),
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) {
                                        return child;
                                      } else {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  ),
                                ),
                              ),
                            if (provider.textData != null) ...[
                              Text(
                                provider.textData!['EmployeeName'] ?? 'No Name',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                provider.textData!['Designation'] ??
                                    'No Designation',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Text(
                                "ADITYA COLLEGE OF ENGINEERING & TECHNOLOGY",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ]
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Divider(),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Custom_IconButton(
                  //         icon: Icons.star_border, function: () {}),
                  //     Custom_IconButton(icon: Icons.edit, function: () => {}),
                  //     Custom_IconButton(
                  //         icon: Icons.person_add_alt, function: () => {}),
                  //   ],
                  // ),
                  // const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(66, 180, 180, 180),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50)),
                            child: Custom_IconButton(
                              icon: Icons.phone_in_talk_rounded,
                              function: () => _makeUricall(
                                  'tel', provider.textData!['MobileNo'] ?? ''),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Call", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(66, 180, 180, 180),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50)),
                            child: Custom_IconButton(
                              icon: Icons.messenger_outline,
                              function: () => _makeUricall(
                                  'sms', provider.textData!['MobileNo'] ?? ''),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Message", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(66, 180, 180, 180),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                )
                              ],
                              borderRadius: BorderRadius.circular(50)),
                          child: Custom_IconButton(
                            icon: Icons.email_outlined,
                            function: () => _makeUricall(
                                'mailto', provider.textData!['EmailId'] ?? ''),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Email", style: TextStyle(fontSize: 14)),
                      ]),
                    ],
                  ),
                  // if (provider.textData != null)
                  //   ListTile(
                  //     leading: Text(
                  //       provider.textData!['MobileNo'] ?? 'No Mobile No',
                  //       style: const TextStyle(
                  //           fontSize: 20, fontWeight: FontWeight.normal),
                  //     ),
                  //     title: Custom_IconButton(
                  //       icon: Icons.message_outlined,
                  //       function: () => _makeUricall(
                  //           'sms', provider.textData!['MobileNo'] ?? ''),
                  //     ),
                  //     trailing: Custom_IconButton(
                  //       icon: Icons.phone,
                  //       function: () => _makeUricall(
                  //           'tel', provider.textData!['MobileNo'] ?? ''),
                  //     ),
                  //   ),
                  // const Divider(),
                  // if (provider.textData != null)
                  //   ListTile(
                  //     leading: Text("Email",
                  //         style: TextStyle(fontSize: 20, color: primarycolor)),
                  //     title: Text(
                  //       provider.textData!['EmailId'] ?? 'No Email',
                  //       style: const TextStyle(
                  //           fontSize: 20, fontWeight: FontWeight.normal),
                  //     ),
                  //     trailing: Custom_IconButton(
                  //       icon: Icons.email_outlined,
                  //       function: () => _makeUricall(
                  //           'mailto', provider.textData!['EmailId'] ?? ''),
                  //     ),
                  //   ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
