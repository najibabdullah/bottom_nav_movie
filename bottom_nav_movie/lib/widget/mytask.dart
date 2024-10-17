import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onDelete;

  TaskCard({
    required this.title,
    required this.description,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Task Information
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Delete Icon (similar to bookmark)
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}