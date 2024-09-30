import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  TextField({
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    required InputDecoration decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
        ),
        hintText: hintText,
      ),
    );
  }
}
