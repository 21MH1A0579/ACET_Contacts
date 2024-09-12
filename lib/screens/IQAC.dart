// iqac_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/constants.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/profile_widget.dart';
import '../provider/provider.dart'; // Adjust the path as needed

class Iqac_Screen extends StatelessWidget {
  const Iqac_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "IQAC",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Consumer<IqacDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: primarycolor),
            );
          } else if (provider.iqacList.isEmpty) {
            return Center(
              child: Text(
                "No IQAC data available",
                style: TextStyle(fontSize: 18, color: primarycolor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.iqacList.length,
              itemBuilder: (context, index) {
                final iqac = provider.iqacList[index];
                return Custom_ListItem(
                  name: iqac['Employee.name'] ?? 'N/A',
                  designation: "IQAC - ${iqac['Dept'] ?? 'N/A'}",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileWidget(
                          name: iqac['Employee.name'] ?? 'N/A',
                          phonenumber1: iqac['Number']?.toString() ?? 'N/A',
                          phonenumber2: 'null',
                          designation: 'IQAC-${iqac['Dept']}',
                          email: iqac['Email.Id'] ?? 'N/A',
                          title: "NODATA",
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
