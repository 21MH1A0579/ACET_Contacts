// transport_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Transport",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Consumer<TransportDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primarycolor),
            );
          } else if (provider.transports.isEmpty) {
            return Center(
              child: Text(
                "No Transport data available",
                style: TextStyle(fontSize: 18, color: primarycolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.transports.length,
              itemBuilder: (context, index) {
                final transport = provider.transports[index];
                return Custom_ListItem(
                  name: transport['name'] ?? 'No Name',
                  designation: transport['designation'],
                  ontap: () {
                    if (transport['number'] != null && transport['number']!.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileWidget(
                            name: transport['name']!,
                            phonenumber1: transport['number']!,
                            phonenumber2: 'null',
                            designation: transport['designation'] ?? 'No Designation',
                            email: transport['EmailId'] ?? 'No Email',
                            title: "NODATA"
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
