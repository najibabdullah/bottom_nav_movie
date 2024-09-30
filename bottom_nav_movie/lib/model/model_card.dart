import 'package:flutter/material.dart';

class ModelCard {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  ModelCard(
    this.icon,
    this.color,
    this.text,
    this.onPressed,
  );
}