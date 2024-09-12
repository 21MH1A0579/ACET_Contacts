// hods_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';
import '../provider/provider.dart'; // Adjust the path as needed

class Hods_Screen extends StatelessWidget {
  const Hods_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Consumer<HodsDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primarycolor),
            );
          } else if (provider.hods.isEmpty) {
            return Center(
              child: Text(
                "No HOD's data available",
                style: TextStyle(fontSize: 18, color: primarycolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.hods.length,
              itemBuilder: (context, index) {
                final hod = provider.hods[index];
                return Custom_ListItem(
                  name: hod['EmployeeName'] ?? 'No Name',
                  designation: "HOD - ${hod['Dept'] ?? 'No Department'}",
                  ontap: () {
                    if (hod['MobileNo'] != null && hod['MobileNo']!.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileWidget(
                            name: hod['EmployeeName']!,
                            phonenumber1: hod['MobileNo']!,
                            phonenumber2: 'null',
                            designation: hod['Designation'] ?? 'No Designation',
                            email: hod['EmailId'] ?? 'No Email',
                            title: hod['EmpId'],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
