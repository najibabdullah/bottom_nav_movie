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
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/icon/akuucihuy.jpg'),
          ),
          SizedBox(height: 10),
          Text(
            'Najibunn',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          SizedBox(height: 20),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                movieCard('082141079928',
                    'https://media.istockphoto.com/id/1264265220/id/vektor/ikon-telepon-simbol-aplikasi-panggilan-tanda-antarmuka-datar-logo-telepon-lama-bentuk.jpg?s=2048x2048&w=is&k=20&c=yB5Z26lw7hJh1qJcWBObnHiYAxrB-6jrFK0gtvmpJwQ='),
                movieCard('najib@gmail.com',
                    'https://static.vecteezy.com/system/resources/previews/002/205/854/non_2x/email-icon-free-vector.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
