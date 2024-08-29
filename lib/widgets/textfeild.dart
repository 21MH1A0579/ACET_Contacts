import 'package:flutter/material.dart';
class InputTextFeild extends StatelessWidget {
  TextEditingController controller=new TextEditingController();
  final IconData icon;
  final String label;
  final bool IsObscure;
  InputTextFeild(
      {
        super.key,
        required this.icon,
        required this.label,
        required this.controller,
        this.IsObscure=false,
      }
      );
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: IsObscure,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width:2,
            color: Colors.orange,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide(
            width:2,
            color: Colors.orange,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: label,
        prefixIcon: Icon(icon,color: Colors.orangeAccent,),
      ),
    );
  }
}
