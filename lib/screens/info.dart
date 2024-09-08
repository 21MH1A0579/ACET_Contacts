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
          
                      // Phone Row
                      Row(
                        children: [
                          Icon(Icons.phone, color: primarycolor, size: 18),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              "+91 9573282201",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
          
                      // Email Row
                      Row(
                        children: [
                          Icon(Icons.email, color: primarycolor, size: 18),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              "chalumuribrahmendra@gmail.com",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
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
