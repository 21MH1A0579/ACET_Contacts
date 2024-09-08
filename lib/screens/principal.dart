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
      body: Consumer<PrincipalDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
                child: CircularProgressIndicator(color: primarycolor));
          } else {
            return CustomScrollView(slivers: [
              SliverAppBar(
                expandedHeight: size.height * 0.5,
                elevation: 0,
                snap: true,
                floating: true,
                stretch: true,
                backgroundColor: Colors.grey.shade50,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [StretchMode.zoomBackground],
                  background: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..scale(1.5),
                    alignment: Alignment.topCenter,
                    child: Image.network(
                      provider.imgData?['imgurl'],
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/no_image.png',
                      ),
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: primarycolor,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Transform.translate(
                    offset: const Offset(0, 1),
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.textData!['EmployeeName'] ?? '',
                                    softWrap: true,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    provider.textData!['Designation'] ?? '',
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange.shade200,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  const Text(
                                    "Emp ID",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    provider.textData!['Employee'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                            "Aditya College of Engineering and Technology"),
                        const Divider(
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Phone",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "+91 ${provider.textData!['MobileNo'] ?? ''}",
                                      style: const TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const VerticalDivider(
                                      width: 0.5,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _makeUricall("tel",
                                            provider.textData!['MobileNo']);
                                      },
                                      icon: const Icon(Icons.phone),
                                    ),
                                    const VerticalDivider(
                                      width: 0.5,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _makeUricall("sms",
                                            provider.textData!['MobileNo']);
                                      },
                                      icon: const Icon(Icons.chat_rounded),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    provider.textData!['EmailId'] ?? '',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      const VerticalDivider(
                                        width: 0.5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _makeUricall('mailto',
                                              provider.textData!['EmailId']);
                                        },
                                        icon: const Icon(Icons.outgoing_mail),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]))
            ]);
            // return SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(top: 8.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 if (provider.imgData != null)
            //                   ClipOval(
            //                     child: CircleAvatar(
            //                       radius: isPortrait
            //                           ? size.width / 3.7
            //                           : size.width * 0.15,
            //                       backgroundColor: Colors.purple.shade100,
            //                       child: Image.network(
            //                         cacheHeight: 500,
            //                         cacheWidth: 500,
            //                         provider.imgData?['imgurl'] ?? '',
            //                         errorBuilder:
            //                             (context, error, stackTrace) =>
            //                                 Image.asset(
            //                           'assets/no_image.png',
            //                         ),
            //                         loadingBuilder: (context, child, progress) {
            //                           if (progress == null) {
            //                             return child;
            //                           } else {
            //                             return const Center(
            //                                 child: CircularProgressIndicator());
            //                           }
            //                         },
            //                       ),
            //                     ),
            //                   ),
            //                 if (provider.textData != null) ...[
            //                   Text(
            //                     provider.textData!['EmployeeName'] ?? 'No Name',
            //                     style: const TextStyle(
            //                         fontWeight: FontWeight.bold, fontSize: 25),
            //                   ),
            //                   Text(
            //                     provider.textData!['Designation'] ??
            //                         'No Designation',
            //                     style: const TextStyle(
            //                         fontWeight: FontWeight.bold, fontSize: 18),
            //                   ),
            //                   const Text(
            //                     "ADITYA COLLEGE OF ENGINEERING & TECHNOLOGY",
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold, fontSize: 14),
            //                   ),
            //                 ]
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.only(left: 15, right: 15),
            //         child: Divider(),
            //       ),
            //       // Row(
            //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       //   children: [
            //       //     Custom_IconButton(
            //       //         icon: Icons.star_border, function: () {}),
            //       //     Custom_IconButton(icon: Icons.edit, function: () => {}),
            //       //     Custom_IconButton(
            //       //         icon: Icons.person_add_alt, function: () => {}),
            //       //   ],
            //       // ),
            //       // const Divider(),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Column(
            //             children: [
            //               Container(
            //                 height: 60,
            //                 width: 60,
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     boxShadow: const [
            //                       BoxShadow(
            //                         color: Color.fromARGB(66, 180, 180, 180),
            //                         spreadRadius: 2,
            //                         blurRadius: 6,
            //                       )
            //                     ],
            //                     borderRadius: BorderRadius.circular(50)),
            //                 child: Custom_IconButton(
            //                   icon: Icons.phone_in_talk_rounded,
            //                   function: () => _makeUricall(
            //                       'tel', provider.textData!['MobileNo'] ?? ''),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 5,
            //               ),
            //               const Text("Call", style: TextStyle(fontSize: 14)),
            //             ],
            //           ),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           Column(
            //             children: [
            //               Container(
            //                 height: 60,
            //                 width: 60,
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     boxShadow: const [
            //                       BoxShadow(
            //                         color: Color.fromARGB(66, 180, 180, 180),
            //                         spreadRadius: 2,
            //                         blurRadius: 6,
            //                       )
            //                     ],
            //                     borderRadius: BorderRadius.circular(50)),
            //                 child: Custom_IconButton(
            //                   icon: Icons.messenger_outline,
            //                   function: () => _makeUricall(
            //                       'sms', provider.textData!['MobileNo'] ?? ''),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 5,
            //               ),
            //               const Text("Message", style: TextStyle(fontSize: 14)),
            //             ],
            //           ),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           Column(children: [
            //             Container(
            //               height: 60,
            //               width: 60,
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   boxShadow: const [
            //                     BoxShadow(
            //                       color: Color.fromARGB(66, 180, 180, 180),
            //                       spreadRadius: 2,
            //                       blurRadius: 6,
            //                     )
            //                   ],
            //                   borderRadius: BorderRadius.circular(50)),
            //               child: Custom_IconButton(
            //                 icon: Icons.email_outlined,
            //                 function: () => _makeUricall(
            //                     'mailto', provider.textData!['EmailId'] ?? ''),
            //               ),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             const Text("Email", style: TextStyle(fontSize: 14)),
            //           ]),
            //         ],
            //       ),
            //       // if (provider.textData != null)
            //       //   ListTile(
            //       //     leading: Text(
            //       //       provider.textData!['MobileNo'] ?? 'No Mobile No',
            //       //       style: const TextStyle(
            //       //           fontSize: 20, fontWeight: FontWeight.normal),
            //       //     ),
            //       //     title: Custom_IconButton(
            //       //       icon: Icons.message_outlined,
            //       //       function: () => _makeUricall(
            //       //           'sms', provider.textData!['MobileNo'] ?? ''),
            //       //     ),
            //       //     trailing: Custom_IconButton(
            //       //       icon: Icons.phone,
            //       //       function: () => _makeUricall(
            //       //           'tel', provider.textData!['MobileNo'] ?? ''),
            //       //     ),
            //       //   ),
            //       // const Divider(),
            //       // if (provider.textData != null)
            //       //   ListTile(
            //       //     leading: Text("Email",
            //       //         style: TextStyle(fontSize: 20, color: primarycolor)),
            //       //     title: Text(
            //       //       provider.textData!['EmailId'] ?? 'No Email',
            //       //       style: const TextStyle(
            //       //           fontSize: 20, fontWeight: FontWeight.normal),
            //       //     ),
            //       //     trailing: Custom_IconButton(
            //       //       icon: Icons.email_outlined,
            //       //       function: () => _makeUricall(
            //       //           'mailto', provider.textData!['EmailId'] ?? ''),
            //       //     ),
            //       //   ),
            //     ],
            //   ),
            // );
          }
        },
      ),
    );
  }
}
