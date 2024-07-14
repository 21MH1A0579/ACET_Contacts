import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Custom_Container extends StatelessWidget {
  final String imgaddress;
  final String title;
  final VoidCallback onTap;

  const Custom_Container({super.key, required this.imgaddress, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: isPortrait?screenSize.height/5.03:screenSize.width/5.03,
          width: isPortrait?screenSize.width/2.30:screenSize.height/2.30,
          decoration: BoxDecoration(
            boxShadow:const  [
               BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
               BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  imgaddress,
                  colorFilter: ColorFilter.mode(Colors.orange.shade800, BlendMode.srcIn,),
                  width: screenSize.width/3.806,
                  height: screenSize.height/8.3,
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}