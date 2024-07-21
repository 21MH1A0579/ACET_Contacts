import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:aditya_contacts/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<DocumentSnapshot<Map<String, dynamic>>>> _allUsers;
  List<DocumentSnapshot<Map<String, dynamic>>> _foundUsers = [];

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchAllUsers() async {
    // Define your map of departments
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

    List<DocumentSnapshot<Map<String, dynamic>>> allUsers = [];

    for (String collectionName in departments.values) {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection(collectionName).get();
      allUsers.addAll(snapshot.docs);
    }

    return allUsers;
  }

  @override
  void initState() {
    super.initState();
    _allUsers = fetchAllUsers();
    _allUsers.then((users) {
      setState(() {
        _foundUsers = users;
      });
    });
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.trim().isEmpty) {
      _allUsers.then((users) {
        setState(() {
          _foundUsers = users;
        });
      });
    }else if (RegExp(r'^\d+$').hasMatch(enteredKeyword)) {
      // If the entered keyword is a number, filter based on "EmpId"
      _allUsers.then((users) {
        setState(() {
          _foundUsers = users
              .where((user) => user.data()?["EmpId"]
              ?.toString()
              .contains(enteredKeyword) ?? false)
              .toList();
        });
      });
    }
    else {
      _allUsers.then((users) {
        setState(() {
          _foundUsers = users
              .where((user) => user.data()?["EmployeeName"]
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()) ?? false)
              .toList();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.orange),
                suffixIcon: Icon(Icons.search, color: Colors.orange),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
                future: _allUsers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading data'));
                  } else if (_foundUsers.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            SvgPicture.asset("asserts/no-search-result.svg",
                              colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn,),
                              fit: BoxFit.fitWidth,
                            ),
                            Text("NO DATA FOUND",style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold,color: Colors.red),)
                          ],
                        ),
                      )
                    );
                  } else {
                    return ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) {
                        var user = _foundUsers[index].data();
                        return Custom_ListItemForEmployee(name: user?['EmployeeName'], ontap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileWidget(name: user?['EmployeeName'], designation: user?['Designation'], email: user?['EmailId'], title: "ADITYA COLLEGE OF ENGINEERING & TECHNOLOGY", phonenumber1: user?['MobileNo'], phonenumber2: '_'))), empid: user?['EmpId']);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
