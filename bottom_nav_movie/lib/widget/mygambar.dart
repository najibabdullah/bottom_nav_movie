import 'package:flutter/material.dart';

class MovieGambar extends StatelessWidget {
  final String imageUrl;
  final String title;

  MovieGambar({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
