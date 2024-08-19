
import 'package:flutter/material.dart';

import '../widgets/constants.dart';

class Info_Page extends StatelessWidget {
  const Info_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
      body: Stack(
        children: [
           Image.asset("asserts/aditya_inst.jpg"
               ,fit: BoxFit.cover,
             height: 500,
             width: double.maxFinite,
           )
        ],
      ),
      ),
    );
  }
}
