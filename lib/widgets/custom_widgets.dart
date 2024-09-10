import 'package:aditya_contacts/widgets/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Custom_IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;
  const Custom_IconButton(
      {super.key, required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: Icon(
        icon,
        color: primarycolor,
        size: 30,
      ),
      splashRadius: 50,
    );
  }
}

class Custom_ListItem extends StatelessWidget {
  final String name;
  final String designation;
  final VoidCallback ontap;
  const Custom_ListItem(
      {super.key,
      required this.name,
      required this.designation,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        onTap: ontap,
        selectedColor: primarycolor,
        tileColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 2),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 0.85),
            borderRadius: BorderRadius.circular(10)),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          designation,
          style: const TextStyle(fontSize: 19),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 30,
          color: primarycolor,
        ),
      ),
    );
  }
}

class Custom_DepartMentItem extends StatelessWidget {
  final String name;
  final VoidCallback ontap;
  const Custom_DepartMentItem(
      {super.key, required this.name, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        onTap: ontap,
        selectedColor: primarycolor,
        tileColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 20, right: 5, top: 2, bottom: 2),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.circular(10)),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 30,
          color: primarycolor,
        ),
      ),
    );
  }
}

//
// class Custom_ListTile extends StatelessWidget {
//   final String title;
//   final List<Map<String,String>>persons;
//   const Custom_ListTile({super.key, required this.title, required this.persons});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         title:  Text(
//          title,
//           style: const TextStyle(
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
//           itemCount: persons.length,
//           itemBuilder: (context,index){
//             return Custom_ListItemForEmployee(name: persons[index]["EmployeeName"]!, empid: persons[index]["Emp.Id"]!,
//               ontap: ()=>Navigator.push(
//               context,MaterialPageRoute(builder: (context)=>ProfileWidget(name: persons[index]["EmployeeName"]!, designation: persons[index]["Designation"]!, email: persons[index]["EmailId"]!, title:"EMPLOYEE ID:${persons[index]["Emp.Id"]!}", phonenumber1: persons[index]["Mobile.No"]!, phonenumber2: "",))
//             ),
//             //   ontap: (){
//             //   print(persons[index]["Mobile.No"]);
//             //   },
//
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
class Departments_Screen extends StatelessWidget {
  const Departments_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> departments = {
      'Computer Science & Engineering': "ComputerScienceEngineering",
      'Civil Engineering': "Civil_Engineering",
      'Mechanical Engineering': "Mechanical_Engineering",
      'Electrical & Electronics Engineering': "Electronics",
      'Electronics & Communication Engineering': "Electronics_Engineering",
      'AI & ML and DS': "Artificial_Engineering",
      'Information Technology': "Information_Technology",
      'Humanities and Basic Sciences1': "HBS1",
      'Humanities and Basic Sciences2': "HBS2"
    };

    return Scaffold(
      appBar: AppBar(
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
        itemBuilder: (context, index) {
          String departmentName = departments.keys.elementAt(index);
          String collectionName = departments.values.elementAt(index);
          return Custom_DepartMentItem(
            name: departmentName,
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Custom_ListTile(
                  title: departmentName,
                  collectionName: collectionName,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Custom_ListTile extends StatelessWidget {
  final String title;
  final String collectionName;

  const Custom_ListTile(
      {super.key, required this.title, required this.collectionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(collectionName)
            .orderBy('EmployeeName')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: primarycolor,
            ));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: CircularProgressIndicator(
              color: primarycolor,
            ));
          }
          var persons = snapshot.data!.docs.map((doc) {
            return {
              "EmployeeName": doc['EmployeeName'],
              "EmpId": doc['EmpId'],
              "Designation": doc['Designation'],
              "EmailId": doc['EmailId'],
              "MobileNo": doc['MobileNo'],
              "Gender": doc['Gender']
            };
          }).toList();

          return ListView.builder(
            itemCount: persons.length,
            itemBuilder: (context, index) {
              return Custom_ListItemForEmployee(
                name: persons[index]["EmployeeName"]!,
                empid: persons[index]["EmpId"]!,
                ontap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileWidget(
                      name: persons[index]["EmployeeName"]!,
                      designation: persons[index]["Designation"]!,
                      email: persons[index]["EmailId"]!,
                      title: persons[index]["EmpId"]!,
                      phonenumber1: persons[index]["MobileNo"]!,
                      phonenumber2: "",
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Custom_ListItemForEmployee extends StatelessWidget {
  final String name;
  final String empid;
  final VoidCallback ontap;
  const Custom_ListItemForEmployee(
      {super.key,
      required this.name,
      required this.ontap,
      required this.empid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        onTap: ontap,
        selectedColor: primarycolor,
        tileColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 2),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 0.85),
            borderRadius: BorderRadius.circular(10)),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        subtitle: Text(
          "EMPLOYEE ID:$empid",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 30,
          color: primarycolor,
        ),
      ),
    );
  }
}
