import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';

Widget movieCard(
  String title,
  String imageUrl,
) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    color: Colors.grey[900],
    elevation: 4,
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(title),
      textColor: primaryColor,
      trailing: Icon(Icons.chevron_right),
      onTap: () {
      },
    ),
  );
}
