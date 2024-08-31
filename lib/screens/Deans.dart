// deans_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';
 // Adjust the path as needed

class DeansScreen extends StatelessWidget {
  const DeansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "DEANS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Consumer<DeansDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primarycolor),
            );
          } else if (provider.deans.isEmpty) {
            return Center(
              child: Text(
                "No Deans data available",
                style: TextStyle(fontSize: 18, color: primarycolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.deans.length,
              itemBuilder: (context, index) {
                final dean = provider.deans[index];
                return Custom_ListItem(
                  name: dean['name'] ?? 'No Name',
                  designation: dean['designation'] ?? 'No Designation',
                  ontap: () {
                    if (dean['phnumber1'] != null && dean['phnumber1']!.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileWidget(
                            name: dean['name']!,
                            phonenumber1: dean['phnumber1']!,
                            phonenumber2: dean['phnumber2']!,
                            designation: dean['designation']!,
                            email: dean['email']!,
                            title: "DEANS",
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
