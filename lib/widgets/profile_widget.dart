import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
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

    Future<void> addContact() async {
      // Request permission to access contacts
      PermissionStatus permission = await Permission.contacts.request();

      if (permission.isGranted) {
        // Create a new contact with the provided information

        Contact newContact = Contact(
          givenName: widget.name,
          phones: [Item(label: "mobile", value: widget.phonenumber1)],
          emails: [Item(label: "work", value: widget.email)],
          jobTitle: widget.designation,
        );

        try {
          await ContactsService.addContact(newContact);
          List<Contact> data =
              await ContactsService.getContacts(query: widget.name);
          await ContactsService.openExistingContact(data.first);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Contact Added Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add contact: $e')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permission denied')),
        );
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
                                      fontSize: 22,
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
                                      color: Colors.green,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 60,
                              width: 100,
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
                                        color: Colors.black54),
                                  ),
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                            "Aditya College of Engineering and Technology",style: TextStyle(fontWeight:FontWeight.bold),),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const VerticalDivider(
                                        width: 0.5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          makeUricall(
                                              "tel", widget.phonenumber1);
                                        },
                                        icon: const Icon(Icons.phone),
                                      ),
                                      const VerticalDivider(
                                        width: 0.5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          makeUricall(
                                              "sms", widget.phonenumber1);
                                        },
                                        icon: const Icon(Icons.chat_rounded),
                                      ),
                                      const VerticalDivider(
                                        width: 0.5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          addContact();
                                        },
                                        icon: const Icon(
                                            Icons.person_add_alt_1_rounded),
                                      ),
                                    ],
                                  ),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
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
                                  ),
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
    final height = MediaQuery.of(context).size.height;
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 6.0),
                      blurRadius: 15.0,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
              width: double.infinity,
              height: height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          foregroundImage: AssetImage("asserts/profile.jpg"),
                        ),
                        const SizedBox(width: 30),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                softWrap: true,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                widget.name1,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                "Aditya College of Engineering\n and Technology",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Colors.grey.shade300,
                      thickness: 0.5,
                    ),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
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
                                  const VerticalDivider(
                                    width: 0.5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.person_add_alt_1_rounded),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                  // color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 6.0),
                      blurRadius: 15.0,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
              width: double.infinity,
              height: height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          foregroundImage: AssetImage("asserts/profile.jpg"),
                        ),
                        const SizedBox(width: 60),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                widget.name2,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                "Aditya College of Engineering\n and Technology",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Colors.grey.shade300,
                      thickness: 0.5,
                    ),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  const VerticalDivider(
                                    width: 0.5,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      makeUricall("tel", widget.phonenumber2);
                                    },
                                    icon: const Icon(Icons.phone),
                                  ),
                                  const VerticalDivider(
                                    width: 0.5,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      makeUricall("sms", widget.phonenumber2);
                                    },
                                    icon: const Icon(Icons.chat_rounded),
                                  ),
                                  const VerticalDivider(
                                    width: 0.5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.person_add_alt_1_rounded),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}