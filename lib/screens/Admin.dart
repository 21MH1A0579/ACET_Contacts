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
  bool IsLoginpageLoading=false;
  TextEditingController usernamecontroller=new TextEditingController();

  TextEditingController passwordcontroller=new TextEditingController();

  Future<void> _login() async {
    try {
      setState(() {
        IsLoginpageLoading = true;
      });
      String username = usernamecontroller.text.trim();
      String password = passwordcontroller.text.trim();

      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('admin')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();

      final List<DocumentSnapshot> documents = result.docs;

      if (documents.length == 1) {

        Navigator.push(context,MaterialPageRoute(builder: (context)=>AdminMainPage()));
        usernamecontroller.clear();
        passwordcontroller.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        IsLoginpageLoading = false;
      });
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernamecontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Stack(
        children:[
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
                  ]
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60,left:22),
              child: Text("Hello\nLog in!",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              height: double.maxFinite,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(55)
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                      backgroundImage:AssetImage("asserts/adityalogo.jpg"),
                      maxRadius: 75,
                    ),
                  ),
                  const SizedBox(height: 45,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InputTextFeild(icon: Icons.email,label: "Enter Your College Email",controller: usernamecontroller,),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: InputTextFeild(icon: Icons.password,label: "Enter Your Password",IsObscure: true,controller: passwordcontroller,),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: InkWell(
                      onTap:()
                      {
                        _login();


                      },

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
                                ]
                            )
                        ),
                        width: double.infinity,
                        height: 55,
                        child: Center(child: IsLoginpageLoading?const CircularProgressIndicator(color: Colors.white,):const Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
