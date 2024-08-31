import 'package:aditya_contacts/screens/AdminMain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/textfeild.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final Map<String, String> departments = {
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

  bool isLoginPageLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedDepartment;

  Future<void> _login() async {
    try {
      setState(() {
        isLoginPageLoading = true;
      });

      String username = usernameController.text.trim();
      String password = passwordController.text.trim();
      final List<DocumentSnapshot> documents;

      // Correctly specify the collection name here
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('admin') // Replace with correct collection name if needed
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();

      documents = result.docs;

      if (documents.length == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMainPage()));
        usernameController.clear();
        passwordController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoginPageLoading = false;
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange.shade900,
                  Colors.orange.shade800,
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60, left: 22),
              child: Text(
                "Hello\nSign in!",
                style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(55),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("asserts/adityalogo.jpg"), // Corrected path
                      maxRadius: 75,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputTextFeild(
                      icon: Icons.email,
                      label: "Enter Your Employee ID",
                      controller: usernameController,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputTextFeild(
                      icon: Icons.password,
                      label: "Enter Your Password",
                      controller: passwordController,
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text('Select a department'),
                    value: selectedDepartment,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDepartment = newValue;
                      });
                    },
                    items: departments.keys.map((String department) {
                      return DropdownMenuItem<String>(
                        value: department,
                        child: Text(department),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: InkWell(
                      onTap: _login,
                      splashColor: Colors.red,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.orange.shade600,
                              Colors.orange.shade900,
                            ],
                          ),
                        ),
                        width: double.infinity,
                        height: 55,
                        child: Center(
                          child: isLoginPageLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
