import 'package:aditya_contacts/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      'Computer Science & Engineering': "ComputerScienceEngineering",
      'Civil Engineering': "Civil_Engineering",
      'Mechanical Engineering': "Mechanical_Engineering",
      'Electrical & Electronics Engineering': "Electrical_Engineering",
      'Electronics & Communication Engineering': "Electronics_Engineering",
      'AI & ML and DS': "Artificial_Engineering",
      'Information Technology': "Information_Technology",
      'Humanities and Basic Sciences1': "HBS1",
      'Humanities and Basic Sciences2': "HBS2"
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
    } else {
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
                  } else {
                    return ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) {
                        var user = _foundUsers[index].data();
                        return Custom_ListItemForEmployee(name: user?['EmployeeName'], ontap: (){}, empid: user?['EmpId']);
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
