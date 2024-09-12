import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Custom_Container extends StatelessWidget {
  final String imgaddress;
  final String title;
  final VoidCallback onTap;

  const Custom_Container(
      {super.key,
        required this.imgaddress,
        required this.title,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: isPortrait ? screenSize.height / 6 : screenSize.width / 8.5,
          width: isPortrait ? screenSize.width / 3.5 : screenSize.height / 2.3,
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
                SvgPicture.asset(
                  imgaddress,
                  colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 236, 115, 10),
                    BlendMode.srcIn,
                  ),
                  width: screenSize.width / 6,
                  height: screenSize.height / 12,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
