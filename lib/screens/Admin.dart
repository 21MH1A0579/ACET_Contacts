
import 'package:aditya_contacts/screens/AdminMain.dart';
import 'package:aditya_contacts/screens/userprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/textfeild.dart';


// DropdownButton<String>(
// hint: Text('Select a department'),
// value: selectedDepartment,
// onChanged: (String? newValue) {
// setState(() {
// selectedDepartment = newValue;
// });
// },
// items: departments.keys.map((String department) {
// return DropdownMenuItem<String>(
// value: department,
// child: Text(department),
// );
// }).toList(),
// ),

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {


  bool isLoginPageLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedDepartment;
  Future<void> _login() async {
      setState(() {
        isLoginPageLoading = true;
      });

      String username = usernameController.text.trim();
      String password = passwordController.text.trim();

      if (username.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter both username and password')),

        );
        setState(() {
          isLoginPageLoading=false;
        });
        return;
      }

      final bool isUsernameNumeric = RegExp(r'^\d+$').hasMatch(username);

      if (isUsernameNumeric) {
        // Handle department-specific collections
        if(password != '${username}@acet')
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid Password:${password}')),
            );
            setState(() {
              isLoginPageLoading=false;
            });
            return;
          }
        bool found = false;
        DocumentSnapshot? snapshot;
        DocumentSnapshot? Imagedata;
        bool isimage=true;
        String? UserDepartment;
        for (String department in departments.values) {
          snapshot = await FirebaseFirestore.instance.collection(department).doc('${username} ').get();
          print(snapshot.data());
          if(snapshot.data() != null)
            {
              Imagedata=await FirebaseFirestore.instance.collection("imagedata").doc(username).get();
              if(Imagedata.exists)
                {
                  isimage=true;
                }
              else{
                isimage=false;
              }
              UserDepartment=department;
              found=true;
              break;
            }
        }
        if (found) {
          setState(() {
            isLoginPageLoading=false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileUpdateScreen(
                data: snapshot, department: UserDepartment,
                IsImage:isimage,
                imagedata: isimage?Imagedata:null,

              ),
            ),
          );
          usernameController.clear();
          passwordController.clear();
        } else {
          setState(() {
            isLoginPageLoading=false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Credentials')),
          );
        }
      }else if(RegExp(r'^[a-zA-Z]+$').hasMatch(username) && RegExp(r'^[0-9]+$').hasMatch(username))
      {
        setState(() {
          isLoginPageLoading=false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid UserName')),
        );
      }
      else {
        setState(() {
          isLoginPageLoading=true;
        });
        // Handle general admin collection
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection('admin')
            .where('username', isEqualTo: username)
            .where('password', isEqualTo: password)
            .get();

        if (result.docs.length == 1) {
          setState(() {
            isLoginPageLoading=false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminMainPage(),
            ),
          );
          usernameController.clear();
          passwordController.clear();
        } else {
          setState(() {
            isLoginPageLoading=false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Username or Password')),
          );
        }
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
