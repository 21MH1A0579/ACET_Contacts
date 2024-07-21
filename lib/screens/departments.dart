import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:aditya_contacts/widgets/database.dart';
import 'package:flutter/material.dart';

import '../widgets/constants.dart';
class Departments_Screen extends StatelessWidget {
  const Departments_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> departments = {
      'AI & ML and DS': "AIandML_Engineering",
      'Computer Science & Engineering': "Computer_Science_Engineering",
      'Civil Engineering': "Civil_Engineering",
      'Electrical & Electronics Engineering': "ElectricalandElectronicsEngineering",
      'Electronics & Communication Engineering': "ElectronicsaandCommunicationEngineering",
      'Humanities and Basic Sciences1': "HBS1",
      'Humanities and Basic Sciences2': "HBS2",
      'Information Technology': "Information_Technology",
    'Mechanical Engineering': "Mechanical_Engineering"
    };
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "DEPARTMENTS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: ListView.builder(
        itemCount: departments.length,
        itemBuilder: (context,index){
          return Custom_DepartMentItem(name: departments.keys.elementAt(index), ontap:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>Custom_ListTile(title: departments.keys.elementAt(index), collectionName: departments.values.elementAt(index)))),
          );
        },
      ),
    );
  }
}
