import 'package:flutter/material.dart';

class Mytextslide extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  Mytextslide({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: const Color.fromARGB(255, 241, 241, 241), fontSize: 14),
      ),
    );
  }
}
