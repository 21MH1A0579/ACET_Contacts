import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/constants.dart';

class ProfileWidget extends StatefulWidget {
  final String name, phonenumber1, phonenumber2, designation, email, title;
  const ProfileWidget({
    super.key,
    required this.name,
    required this.designation,
    required this.email,
    required this.title,
    required this.phonenumber1,
    required this.phonenumber2,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool imageFound = false;
  late DocumentSnapshot snapshot;

  @override
  void initState() {
    super.initState();
    getImageData();
  }

  Future<void> getImageData() async {
    final id = widget.title;
    snapshot =
        await FirebaseFirestore.instance.collection("imagedata").doc(id).get();
    if (snapshot.exists) {
      setState(() {
        imageFound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Future<void> makeUricall(String scheme, String address) async {
      final Uri launchUri = Uri(scheme: scheme, path: address);
      if (await canLaunch(launchUri.toString())) {
        await launch(launchUri.toString());
      } else {
        throw 'Could not launch $address';
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: size.height * 0.5,
              elevation: 0,
              snap: true,
              floating: true,
              stretch: true,
              backgroundColor: Colors.grey.shade50,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground],
                background: imageFound
                    ? Image.network(
                        snapshot.get("imgurl"),
                        fit: BoxFit.cover,
                      )
                    : Image.asset("asserts/no_image.png", fit: BoxFit.cover),
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
                                    widget.name,
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
                                    widget.designation,
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
                                    widget.title,
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
                                      "+91 ${widget.phonenumber1}",
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
                                        makeUricall("tel", widget.phonenumber1);
                                      },
                                      icon: const Icon(Icons.phone),
                                    ),
                                    const VerticalDivider(
                                      width: 0.5,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        makeUricall("sms", widget.phonenumber1);
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.email,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    const VerticalDivider(
                                      width: 0.5,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        makeUricall(
                                          'mailto',
                                          widget.email.trim(),
                                        );
                                      },
                                      icon: const Icon(Icons.outgoing_mail),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

// return Scaffold(
//   appBar: AppBar(
//     foregroundColor: Colors.white,
//     centerTitle: true,
//     title: Text(
//       widget.title,
//       style: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontStyle: FontStyle.italic,
//       ),
//     ),
//     backgroundColor: primarycolor,
//   ),
//   body: SingleChildScrollView(
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   // ClipOval(
//                   //   child: CircleAvatar(
//                   //     radius: ispotraint?size.width/3.90:size.width/6,
//                   //     // backgroundColor: Colors.orange.shade500,
//                   //     child: imagefound?Image.network(snapshot.get("imgurl")):Image.asset("asserts/no_image.png"),
//                   //   ),
//                   // ),
//                   CircleAvatar(
//                     radius: ispotraint ? size.width / 3.90 : size.width / 6,
//                     backgroundColor: Colors.grey,
//                     foregroundImage: imagefound
//                         ? NetworkImage(snapshot.get("imgurl"), scale: 10)
//                         : const AssetImage("asserts/no_image.png"),
//                     // Image.network(snapshot.get("imgurl"),fit:BoxFit.cover) as ImageProvider:Image.asset("asserts/no_image.png") as ImageProvider,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     widget.name,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 17),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     widget.designation,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   const Text(
//                     "ADITYA COLLEGE OF ENGINEERING & TECHNOLOGY",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 14),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         const Divider(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Custom_IconButton(icon: Icons.star_border, function: () {}),
//             Custom_IconButton(icon: Icons.edit, function: () => {}),
//             Custom_IconButton(
//                 icon: Icons.person_add_alt, function: () async {}),
//           ],
//         ),
//         const Divider(),
//         ListTile(
//           leading: Custom_IconButton(
//               icon: Icons.message_outlined,
//               function: () => makeUricall('sms', widget.phonenumber1)),
//           title: Text(
//             widget.phonenumber1,
//             style: const TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.normal),
//           ),
//           trailing: Custom_IconButton(
//               icon: Icons.phone,
//               function: () => makeUricall('tel', widget.phonenumber1)),
//         ),
//         widget.phonenumber2.length > 5
//             ? ListTile(
//                 leading: Custom_IconButton(
//                     icon: Icons.message_outlined,
//                     function: () =>
//                         makeUricall('sms', widget.phonenumber2)),
//                 title: Text(
//                   widget.phonenumber2,
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.normal),
//                 ),
//                 trailing: Custom_IconButton(
//                     icon: Icons.phone,
//                     function: () =>
//                         makeUricall('tel', widget.phonenumber2)),
//               )
//             : const SizedBox(
//                 height: 0.5,
//               ),
//         const Divider(),
//         ListTile(
//           title: widget.email.length <= 5
//               ? const Text(
//                   "No Email Found",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red),
//                 )
//               : Text(
//                   widget.email,
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.normal),
//                 ),
//           trailing: Custom_IconButton(
//               icon: Icons.email_outlined,
//               function: () => makeUricall('mailto', widget.email.trim())),
//         )
//       ],
//     ),
//   ),
// );

class Committee_ProfileWidget extends StatefulWidget {
  final String name1, name2, phonenumber1, phonenumber2, committe_name;
  const Committee_ProfileWidget(
      {super.key,
      required this.phonenumber1,
      required this.phonenumber2,
      required this.name1,
      required this.name2,
      required this.committe_name});

  @override
  State<Committee_ProfileWidget> createState() =>
      _Committee_ProfileWidgetState();
}

class _Committee_ProfileWidgetState extends State<Committee_ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    Future<void> makeUricall(
      String scheme,
      String address,
    ) async {
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

    final Size size = MediaQuery.of(context).size;
    final ispotraint =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.committe_name,
          style: const TextStyle(
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
                          radius:
                              ispotraint ? size.width / 3.80 : size.width / 7,
                          // backgroundColor: Colors.orange.shade500,
                          child: Image.asset("asserts/no_image.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.name1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const Text(
                        "&",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        widget.name2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "ADITYA COLLEGE OF ENGINEERING & TECHNOLOGY",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
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
                Custom_IconButton(
                    icon: Icons.person_add_alt, function: () async {}),
              ],
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Contact Details",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                backgroundColor: Colors.blue.shade100,
                iconColor: Colors.red,
                initiallyExpanded: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text(
                  widget.name1,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                children: [
                  Column(
                    children: [
                      const Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Custom_IconButton(
                              icon: Icons.message_outlined,
                              function: () =>
                                  makeUricall('sms', widget.phonenumber1)),
                          title: Text(
                            widget.phonenumber1,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          trailing: Custom_IconButton(
                              icon: Icons.phone,
                              function: () =>
                                  makeUricall('tel', widget.phonenumber1)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                backgroundColor: Colors.blue.shade100,
                iconColor: Colors.red,
                initiallyExpanded: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text(
                  widget.name2,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                children: [
                  Column(
                    children: [
                      const Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Custom_IconButton(
                              icon: Icons.message_outlined,
                              function: () =>
                                  makeUricall('sms', widget.phonenumber2)),
                          title: Text(
                            widget.phonenumber2,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          trailing: Custom_IconButton(
                              icon: Icons.phone,
                              function: () =>
                                  makeUricall('tel', widget.phonenumber2)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
