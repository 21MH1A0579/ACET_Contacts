// emergency_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Emergency Contacts",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Consumer<EmergencyDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primarycolor),
            );
          } else if (provider.emergencies.isEmpty) {
            return Center(
              child: Text(
                "No Emergency data available",
                style: TextStyle(fontSize: 18, color: primarycolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.emergencies.length,
              itemBuilder: (context, index) {
                final emergency = provider.emergencies[index];
                return Custom_ListItem(
                  name: emergency['name'] ?? 'No Name',
                  designation: emergency['designation'],
                  ontap: () {
                    if (emergency['number'] != null && emergency['number']!.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileWidget(
                              name: emergency['name']!,
                              phonenumber1: emergency['number']!,
                              phonenumber2: 'null',
                              designation: emergency['designation'] ?? 'No Designation',
                              email: emergency['EmailId'] ?? 'No Email',
                              title: emergency['name']
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
