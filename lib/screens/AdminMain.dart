import 'package:flutter/material.dart';

import '../widgets/constants.dart';
class AdminMainPage extends StatelessWidget {
  const AdminMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "HOD'S",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Center(child: Text("ADMIN MAIN PAGE"),),
    );
  }
}
