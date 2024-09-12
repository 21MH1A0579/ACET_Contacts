import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<DocumentSnapshot<Map<String, dynamic>>>> _allUsers;
  List<DocumentSnapshot<Map<String, dynamic>>> _foundUsers = [];

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchAllUsers() async {
    Map<String, String> departments = {
      'AI & ML and DS': "AIandML_Engineering",
      'Computer Science & Engineering': "Computer_Science_Engineering",
      'Civil Engineering': "Civil_Engineering",
      'Electrical & Electronics Engineering':
      "ElectricalandElectronicsEngineering",
      'Electronics & Communication Engineering':
      "ElectronicsaandCommunicationEngineering",
      'Humanities and Basic Sciences1': "HBS1",
      'Humanities and Basic Sciences2': "HBS2",
      'Information Technology': "Information_Technology",
      'Mechanical Engineering': "Mechanical_Engineering"
    };

    List<Future<QuerySnapshot<Map<String, dynamic>>>> futures = departments
        .values
        .map((collectionName) =>
        FirebaseFirestore.instance.collection(collectionName).get())
        .toList();

    List<QuerySnapshot<Map<String, dynamic>>> snapshots =
    await Future.wait(futures);
    List<DocumentSnapshot<Map<String, dynamic>>> allUsers = [];

    for (var snapshot in snapshots) {
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
    } else if (RegExp(r'^\d+$').hasMatch(enteredKeyword)) {
      _allUsers.then((users) {
        setState(() {
          _foundUsers = users
              .where((user) =>
          user.data()?["EmpId"]?.toString().contains(enteredKeyword) ??
              false)
              .toList();
        });
      });
    } else {
      _allUsers.then((users) {
        setState(() {
          _foundUsers = users
              .where((user) =>
          user
              .data()?["EmployeeName"]
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()) ??
              false)
              .toList();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "SEARCH",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: primarycolor,
        ),
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
                  labelText: 'Enter Employee ID or Employee Name',
                  labelStyle: const TextStyle(color: Colors.orange),
                  suffixIcon: const Icon(Icons.search, color: Colors.orange),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
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
                child:
                FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
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
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: SvgPicture.asset(
                                    "asserts/no-search-result.svg",
                                    colorFilter: const ColorFilter.mode(
                                      Colors.red,
                                      BlendMode.srcIn,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const Text(
                                  "NO DATA FOUND ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ));
                    } else {
                      return ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) {
                          var user = _foundUsers[index].data();
                          return Custom_ListItemForEmployee(
                              name: user?['EmployeeName'],
                              ontap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileWidget(
                                          name: user?['EmployeeName'],
                                          designation: user?['Designation'],
                                          email: user?['EmailId'],
                                          title: user?['EmpId'],
                                          phonenumber1: user?['MobileNo'],
                                          phonenumber2: 'null'))),
                              empid: user?['EmpId']);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
