
import 'package:aditya_contacts/screens/AdminMain.dart';
import 'package:aditya_contacts/screens/userprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/textfeild.dart';



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
          SnackBar(content: Text('Please enter both username and password'),backgroundColor: Colors.red,),

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
              SnackBar(content: Text('Invalid Password:${password}'),backgroundColor: Colors.red,),
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
                Username:username,
                data: snapshot, department: UserDepartment,
                IsAlreadyImage:isimage,
                imagedata: isimage==true?Imagedata:null,

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
            SnackBar(content: Text('Invalid Credentials'),backgroundColor: Colors.red,),
          );
        }
      }else if(RegExp(r'^[a-zA-Z]+$').hasMatch(username) && RegExp(r'^[0-9]+$').hasMatch(username))
      {
        setState(() {
          isLoginPageLoading=false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid UserName'),backgroundColor: Colors.red,),
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
            SnackBar(content: Text('Invalid Username or Password'),backgroundColor: Colors.red,),
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
    final double height=MediaQuery.of(context).size.height;
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
                  primarycolor,
                  Colors.orange.shade500,
                  Colors.orange.shade100,
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
            padding: EdgeInsets.only(top: height/3.588),
            child: Container(
              height: double.maxFinite,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(55),),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                      backgroundImage: const AssetImage("asserts/adityalogo.jpg"), // Corrected path
                      maxRadius: height/8.97,
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
                          // gradient: LinearGradient(
                          //   begin: Alignment.topRight,
                          //   end: Alignment.bottomCenter,
                          //   colors: [
                          //     Colors.orange.shade600,
                          //     Colors.orange.shade900,
                          //   ],
                          // ),
                          color: primarycolor
                        ),
                        width: double.infinity,
                        height: 55,
                        child: Center(
                          child: isLoginPageLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w500),
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
