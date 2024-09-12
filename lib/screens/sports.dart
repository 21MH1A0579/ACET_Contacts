// sports_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 // Adjust the path as needed
import '../provider/provider.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Sports",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Consumer<SportsDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primarycolor),
            );
          } else if (provider.sports.isEmpty) {
            return Center(
              child: Text(
                "No Sports data available",
                style: TextStyle(fontSize: 18, color: primarycolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.sports.length,
              itemBuilder: (context, index) {
                final sport = provider.sports[index];
                return Custom_ListItem(
                  name: sport['name'] ?? 'No Name',
                  designation: sport['designation'],
                  ontap: () {
                    if (sport['number'] != null && sport['number']!.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileWidget(
                              name: sport['name']!,
                              phonenumber1: sport['number']!,
                              phonenumber2: 'null',
                              designation: sport['designation'] ?? 'No Designation',
                              email: sport['EmailId'] ?? 'No Email',
                              title: sport['name']
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
