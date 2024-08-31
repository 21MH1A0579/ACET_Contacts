// committee_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';
import '../provider/provider.dart'; // Adjust the path as needed

class Committee_Screen extends StatelessWidget {
  const Committee_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "COMMITTEE'S",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Consumer<CommitteeDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primarycolor),
            );
          } else if (provider.committees.isEmpty) {
            return Center(
              child: Text(
                "No Committee data available",
                style: TextStyle(fontSize: 18, color: primarycolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.committees.length,
              itemBuilder: (context, index) {
                final committee = provider.committees[index];
                return Custom_DepartMentItem(
                  name: committee["Committee_Name"] ?? 'No Name',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Committee_ProfileWidget(
                          phonenumber1: committee['MobileNo1'] ?? '',
                          phonenumber2: committee['MobileNo2'] ?? '',
                          name1: committee['Coordinator1_Name'] ?? 'No Name',
                          name2: committee['Coordinator2_Name'] ?? 'No Name',
                          committe_name: committee['Committee_Name'] ?? 'No Committee Name',
                        ),
                      ),
                    );
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
