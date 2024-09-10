// ignore_for_file: file_names

import 'package:aditya_contacts/screens/AdminMain.dart';
import 'package:aditya_contacts/screens/userprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/textfeild.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage>
    with WidgetsBindingObserver {
  bool isLoginPageLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedDepartment;
  double bottomPadding = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    // ignore: deprecated_member_use
    final bottom = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      bottomPadding = bottom;
    });
  }

  Future<void> _login() async {
    setState(() {
      isLoginPageLoading = true;
    });

    String username = usernameController.text.trim();
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
            builder: (context) => ProfileUpdateScreen(
              Username: username,
              data: snapshot,
              department: UserDepartment,
              IsAlreadyImage: isimage,
              imagedata: isimage ? Imagedata : null,
            ),
          ),
        );
        usernameController.clear();
        passwordController.clear();
      } else {
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
            builder: (context) => const AdminMainPage(),
          ),
        );
        usernameController.clear();
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.white,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: height * 0.8,
                        decoration: BoxDecoration(
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
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Image(
                                width: 100,
                                image: AssetImage("asserts/adityalogo.jpg"),
                              ),
                              const Text(
                                "Welcome to ACET Contacts\nPlease Login with your credentials",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 45),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: InputTextFeild(
                                  icon: Icons.email,
                                  label: "Enter Your Employee ID",
                                  controller: usernameController,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: InputTextFeild(
                                  icon: Icons.lock,
                                  label: "Enter Your Password",
                                  controller: passwordController,
                                  IsObscure: true,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: InkWell(
                                  onTap: _login,
                                  splashColor: Colors.red,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: primarycolor,
                                    ),
                                    width: 100,
                                    height: 50,
                                    child: Center(
                                      child: isLoginPageLoading
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Text(
                                              "LOGIN",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                  textAlign: TextAlign.center,
                                  "Any Issues?\n Please contact IQAC"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Color.fromARGB(255, 14, 5, 5),
                          ),
                        ),
                      ),
                    ],
     
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
