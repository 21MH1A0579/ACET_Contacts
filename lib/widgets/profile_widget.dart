import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/constants.dart';

class ProfileWidget extends StatelessWidget {
  final String name,phonenumber1,phonenumber2,designation,email,title;
  const ProfileWidget({super.key, required this.name, required this.designation, required this.email,  required this.title, required this.phonenumber1, required this.phonenumber2});
  @override
  Widget build(BuildContext context) {
    Future<void> makeUricall(String scheme,String address,) async {
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
    final Size size=MediaQuery.of(context).size;
    final ispotraint =MediaQuery.of(context).orientation==Orientation.portrait;
    return  Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title:  Text(
          title,
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
                          radius: ispotraint?size.width/3.80:size.width/7,
                          // backgroundColor: Colors.orange.shade500,
                          child: Image.asset("asserts/no_image.png"),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),

                      ),
                      const SizedBox(height: 5,),
                       Text(
                        designation,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                }),
              ],
            ),
            const Divider(),
            ListTile(
              leading: Custom_IconButton(icon: Icons.message_outlined,function: ()=>makeUricall('sms',phonenumber1)),
              title: Text(phonenumber1,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
              trailing: Custom_IconButton(icon: Icons.phone,function: ()=>makeUricall('tel',phonenumber1)),
            ),
            phonenumber2.length>5?ListTile(
              leading: Custom_IconButton(icon: Icons.message_outlined,function: ()=>makeUricall('sms',phonenumber2)),
              title: Text(phonenumber2,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
              trailing: Custom_IconButton(icon: Icons.phone,function: ()=>makeUricall('tel',phonenumber2)),
            ):const SizedBox(height: 0.5,),
            const Divider(),
            ListTile(
              title:email.length<=5 ?const Text("No Email Found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),): Text(email,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
              trailing: Custom_IconButton(icon: Icons.email_outlined, function: ()=>makeUricall('mailto',email.trim())),
            )
          ],
        ),
      ),
    );
  }
}








class Committee_ProfileWidget extends StatefulWidget {
  final String name1,name2,phonenumber1,phonenumber2,committe_name;
  const Committee_ProfileWidget({super.key,required this.phonenumber1, required this.phonenumber2, required this.name1, required this.name2, required this.committe_name});

  @override
  State<Committee_ProfileWidget> createState() => _Committee_ProfileWidgetState();
}

class _Committee_ProfileWidgetState extends State<Committee_ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    Future<void> makeUricall(String scheme,String address,) async {
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
    final Size size=MediaQuery.of(context).size;
    final ispotraint =MediaQuery.of(context).orientation==Orientation.portrait;
    return  Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title:  Text(
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
                          radius: ispotraint?size.width/3.80:size.width/7,
                          // backgroundColor: Colors.orange.shade500,
                          child: Image.asset("asserts/no_image.png"),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        widget.name1,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),

                      ),
                      Text(
                        "&",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),

                      ),
                      Text(
                        widget.name2,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),

                      ),
                      const SizedBox(height: 10,),
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
                }),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Contact Details",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            Divider(thickness: 2,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                backgroundColor: Colors.blue.shade100,
                iconColor: Colors.red,
                initiallyExpanded: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                collapsedShape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                title: Text(widget.name1,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                children: [
                  Column(

                    children: [
                      Divider(color: Colors.black,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Custom_IconButton(icon: Icons.message_outlined,function: ()=>makeUricall('sms',widget.phonenumber1)),
                          title: Text(widget.phonenumber1,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          trailing: Custom_IconButton(icon: Icons.phone,function: ()=>makeUricall('tel',widget.phonenumber1)),
                        ),
                      ),
                    ],
                  ),
                ],

              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                backgroundColor: Colors.blue.shade100,
                iconColor: Colors.red,
                initiallyExpanded: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                collapsedShape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
            ),
                title: Text(widget.name2,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                children: [
                  Column(
                    children: [
                      Divider(color: Colors.black,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Custom_IconButton(icon: Icons.message_outlined,function: ()=>makeUricall('sms',widget.phonenumber2)),
                          title: Text(widget.phonenumber2,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                          trailing: Custom_IconButton(icon: Icons.phone,function: ()=>makeUricall('tel',widget.phonenumber2)),
                        ),
                      ),
                    ],
                  ),
                ],

              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}