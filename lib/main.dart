import 'package:aditya_contacts/provider/provider.dart';
import 'package:aditya_contacts/screens/Admin.dart';
import 'package:aditya_contacts/screens/Search_Screen.dart';
import 'package:aditya_contacts/screens/committee.dart';
import 'package:aditya_contacts/screens/info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aditya_contacts/screens/IQAC.dart';
import 'package:flutter/material.dart';
import 'package:aditya_contacts/screens/Deans.dart';
import 'package:aditya_contacts/screens/Hods.dart';
import 'package:aditya_contacts/screens/departments.dart';
import 'package:aditya_contacts/screens/principal.dart';
import 'package:aditya_contacts/widgets/custom_container.dart';
import 'package:provider/provider.dart';

import 'dummy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA3GN-PN8s7K0J9oJCCQXb0l77OPilrOfg",
      appId: "1:1054300875369:android:fb2f2c87c58acc09b9d0f8",
      messagingSenderId: "1054300875369",
      projectId: "aditya-ff271",
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrincipalDataProvider()),
        ChangeNotifierProvider(create: (_) => DeansDataProvider()),
        ChangeNotifierProvider(create: (_) => HodsDataProvider()),
        ChangeNotifierProvider(create: (_) => CommitteeDataProvider()),
        ChangeNotifierProvider(create: (_) => IqacDataProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ACET Contacts',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.2, end: 2.1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));

    // Start the animation
    _controller.forward();

    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: ClipOval(
            child: Image.asset(
              'asserts/adityalogo.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get screen size
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              "asserts/adityalogo.jpg",
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "ACET CONTACTS",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(206, 255, 146, 37),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
            icon: const Icon(Icons.search_outlined,
                color: Colors.white, size: 35),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: isLargeScreen
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.spaceAround,
                  children: [
                    Custom_Container(
                        imgaddress: "asserts/person1.svg",
                        title: "Principal",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const PrincipalScreen()))),
                    Custom_Container(
                        imgaddress: "asserts/person2.svg",
                        title: "Deans",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DeansScreen()))),
                    Custom_Container(
                      imgaddress: "asserts/person4.svg",
                      title: "HOD's",
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Hods_Screen())),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: isLargeScreen
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.spaceAround,
                  children: [
                    Custom_Container(
                        imgaddress: "asserts/departments.svg",
                        title: "Departments",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Departments_Screen()))),
                    Custom_Container(
                        imgaddress: "asserts/iqac_coordinators.svg",
                        title: "IQAC",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Iqac_Screen()))),
                    Custom_Container(
                      imgaddress: "asserts/committee.svg",
                      title: "Committee",
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Committee_Screen())),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: isLargeScreen
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.spaceAround,
                  children: [
                    Custom_Container(
                        imgaddress: "asserts/transport.svg",
                        title: "Transport",
                        onTap: () {}),
                    Custom_Container(
                        imgaddress: "asserts/hostel.svg",
                        title: "Hostels",
                        onTap: () {}),
                    Custom_Container(
                        imgaddress: "asserts/emergency.svg",
                        title: "Emergency",
                        onTap: () async {
                          // insert_principal_data();
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: isLargeScreen
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.spaceAround,
                  children: [],
                ),
                Row(
                  mainAxisAlignment: isLargeScreen
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoPage(),
                        ),
                      ),
                      child: Container(
                        height: screenSize.height / 6,
                        width: screenSize.width / 3.5,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(
                                0.0,
                                6.0,
                              ),
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  height: screenSize.height / 12,
                                  width: screenSize.width / 6,
                                  image: AssetImage("asserts/adityalogo.jpg")),
                              const Text(
                                "Info",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Custom_Container(
                      imgaddress: "asserts/admin.svg",
                      title: "Admin",
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLoginPage())),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
