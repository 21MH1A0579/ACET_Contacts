
import 'package:aditya_contacts/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/constants.dart';
import '../provider/provider.dart'; // Adjust the path as needed

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PrincipalDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
                child: CircularProgressIndicator(color: primarycolor));
          } else {
            return ProfileWidget(name: provider.textData!['EmployeeName'] ?? '', designation:  provider.textData!['Designation'] ?? '', email:  provider.textData!['EmailId'] ?? '', title:provider.textData!["EmpId"]??'', phonenumber1: provider.textData!['MobileNo'], phonenumber2: 'null');
          }
        },
      ),
    );
  }
}
