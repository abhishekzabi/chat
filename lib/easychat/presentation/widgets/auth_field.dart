import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  // const AuthField({super.key});
  final String hinttext;
  final TextEditingController controller;
  final bool isobscured;
  AuthField({required this.hinttext,
  required this.controller,
  this.isobscured=false
  });
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        
      ),
      validator: (value) {
        if (value!.isEmpty){
          return "$hinttext is missing";

        }
        return null;
      },
      obscureText: isobscured,
    );
  }
}