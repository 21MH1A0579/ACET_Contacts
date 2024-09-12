import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/constants.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255,255,255,255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Makes the AppBar transparent
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: primarycolor,size: 40,),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset(
                    "asserts/aditya_bg.jpg",
                    fit: BoxFit.cover,
                    height: 180, // Adjusted height for better balance
                  ),
                ),

                // App Name
                Text(
                  "ACET CONTACTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primarycolor,
                    fontSize: 28, // Slightly smaller for a balanced design
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 20),

                // Information Container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.green[100], // Slightly lighter green for a professional look
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Copyright Information
                      const Text(
                        "© 2024 ACET CONTACTS\n All rights reserved.",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Designed and Developed By
                      const Text(
                        "Designed and Developed by ACET IQAC Team",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Contact Details
                      Text(
                        "Contact Us:",
                        style: TextStyle(
                          color: primarycolor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First line for Dr. G. Sanjiv Rao
                         const Text(
                            'Dr. G. Sanjiv Rao',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Emphasizing the name
                              fontSize: 20, // Larger font for more prominence
                            ),
                          ),
                          Text(
                            'Dean IQAC',
                            style: TextStyle(
                              fontWeight: FontWeight.w400, // Regular weight for designation
                              fontSize: 16,
                              color: Colors.grey.shade700, // Subtle color for contrast
                            ),
                          ),
                          SizedBox(height: 8), // Adding space between each section

                          // Second line for D. V. Ravi Kumar
                         const Text(
                            'D. V. Ravi Kumar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Assoc. Professor, Dept. of CSE,',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Third line for Ch. Brahmendra
                         const Text(
                            'Ch. Brahmendra',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'IV year, Dept. of CSE, ACET.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
