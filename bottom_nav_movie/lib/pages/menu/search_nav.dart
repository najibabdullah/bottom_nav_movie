import 'package:bottom_nav_movie/component/array_search.dart';
import 'package:bottom_nav_movie/widget/mycard2.dart';
import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';

class Searchmenu extends StatelessWidget {
  const Searchmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: asikkcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Search"),
        foregroundColor: primaryColor,
        centerTitle: true,
        actions: [
          Icon(Icons.bookmark),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: primaryColor),
                iconColor: primaryColor,
                suffixIcon: Icon(Icons.search),
                suffixIconColor: primaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30),

            Text(
              'REKOMENDASI',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: recommendedMovies.length,
                itemBuilder: (context, index) {
                  final movie = recommendedMovies[index];
                  return MovieCard2(
                    title: movie['title'],
                    rating: movie['rating'],
                    genre: movie['genre'],
                    year: movie['year'],
                    duration: movie['duration'],
                    imageUrl: movie['imageUrl'],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
