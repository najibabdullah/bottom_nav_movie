import 'package:bottom_nav_movie/widget/mycard2.dart';
import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';

class WatchListmenu extends StatelessWidget {
  const WatchListmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: asikkcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Watch list"),
        automaticallyImplyLeading: false,
        foregroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MovieCard2(
              imageUrl: 'assets/icon/sapiderman.jpeg',
              title: 'Spiderman',
              rating: 9.5,
              genre: 'Action',
              year: 2019,
              duration: '139 minutes',
            ),
            SizedBox(height: 16),
            MovieCard2(
              imageUrl: 'assets/icon/sonicCees.jpg',
              title: 'Sonic the hedgehod',
              rating: 8.5,
              genre: 'Action',
              year: 2021,
              duration: '139 minutes',
            ),
          ],
        ),
      ),
    );
  }
}
