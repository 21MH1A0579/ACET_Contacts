import 'package:flutter/material.dart';
class InputTextFeild extends StatelessWidget {
  TextEditingController controller=TextEditingController();
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
      style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
      obscuringCharacter: '*',
      obscureText: IsObscure,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width:2,
            color: Colors.orange,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder:OutlineInputBorder(
          borderSide: const BorderSide(
            width:2,
            color: Colors.orange,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
        hintText: label,
        prefixIcon: Icon(icon,color: Colors.orangeAccent,),
      ),
    );
  }
}
