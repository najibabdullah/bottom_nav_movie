import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:bottom_nav_movie/widget/myprofile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: asikkcolor,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // Avatar
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/icon/akuucihuy.jpg'),
          ),
          SizedBox(height: 10),

          // Username
          Text(
            'Najibunn',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          SizedBox(height: 5),

          // Email
          Text(
            'najibunn112@Gmail.com',
            style: TextStyle(
              color: primaryColor,
            ),
          ),

          SizedBox(height: 20),
          Divider(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Favorite Movies',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          // Movie list (example cards)
          Expanded(
            child: ListView(
              children: [
                movieCard('Sonic', 'assets/icon/sonicCees.jpg'),
                movieCard('sepiderman', 'assets/icon/sapiderman.jpeg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
