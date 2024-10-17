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


class MovieCategory {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  MovieCategory({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });
}