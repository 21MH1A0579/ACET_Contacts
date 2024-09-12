import 'package:aditya_contacts/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/constants.dart';
import '../widgets/textfeild.dart';
import 'Deans.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoginPageLoading = false;
  TextEditingController empidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double bottomPadding = 0.0;

  @override
  void dispose() {
    empidController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      isLoginPageLoading = true;
    });

    String username = empidController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter both username and password'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: bottomPadding > 0 ? bottomPadding + 10 : 10,
            left: 20,
            right: 20,
          ),
        ),
      );
      setState(() {
        isLoginPageLoading = false;
      });
      return;
    }

    final bool isUsernameNumeric = RegExp(r'^\d+$').hasMatch(username);

    if (isUsernameNumeric) {
      if (password != '$username@acet') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Password'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          isLoginPageLoading = false;
        });
        return;
      }
      bool found = false;
      DocumentSnapshot? snapshot;
      // ignore: non_constant_identifier_names
      DocumentSnapshot? Imagedata;
      bool isimage = true;
      // ignore: non_constant_identifier_names
      String? UserDepartment;
      for (String department in departments.values) {
        snapshot = await FirebaseFirestore.instance
            .collection(department)
            .doc('$username ')
            .get();
        if (snapshot.data() != null) {
          Imagedata = await FirebaseFirestore.instance
              .collection("imagedata")
              .doc(username)
              .get();
          isimage = Imagedata.exists;
          UserDepartment = department;
          found = true;
          break;
        }
      }
      if (found) {
        setState(() {
          isLoginPageLoading = false;
        });

        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        empidController.clear();
        passwordController.clear();
      }
      else {
        setState(() {
          isLoginPageLoading = false;
        });
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Credentials'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(username) &&
        RegExp(r'^[0-9]+$').hasMatch(username)) {
      setState(() {
        isLoginPageLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Username'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        isLoginPageLoading = true;
      });
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('admin')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();

      if (result.docs.length == 1) {
        setState(() {
          isLoginPageLoading = false;
        });
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      empidController.clear();
        passwordController.clear();
      } else {
        setState(() {
          isLoginPageLoading = false;
        });
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Username or Password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
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
                "Welcome\nSign in!",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height/4.15),
            child: Container(
              height: height / 1.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(55),topLeft: Radius.circular(55))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CircleAvatar(
                        backgroundImage: const AssetImage("asserts/adityalogo.jpg"),
                        maxRadius:height/9.22,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: InputTextFeild(
                        icon: Icons.verified_user,
                        label: "Enter Your Employee ID",
                        controller: empidController,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: InputTextFeild(
                        icon: Icons.lock,
                        label: "Enter Your Password",
                        controller: passwordController,
                        IsObscure: true,
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
