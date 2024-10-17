import 'package:bottom_nav_movie/component/array_home.dart';
import 'package:bottom_nav_movie/controllers/databasecontroler.dart';
import 'package:bottom_nav_movie/model/modelfav.dart';
import 'package:bottom_nav_movie/widget/mycard2.dart';
import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchmenu extends StatelessWidget {
  Searchmenu({super.key});

  final DatabaseController _dbHelper =
      Get.put(DatabaseController()); // Inject DatabaseController

  // Add movie to favorites
  void _addToFavorites(MovieModel movie, BuildContext context) async {
    bool isFavorite = await _dbHelper.isFavorite(movie.title);
    if (!isFavorite) {
      await _dbHelper.addFavorite(movie);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${movie.title} added to favorites!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${movie.title} is already in favorites!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Search"),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              style: TextStyle(color: primaryColor),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white),
                suffixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'RECOMMENDED MOVIES',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 0.5, // Adjust for taller cards
                ),
                itemCount: recommendedMovies.length,
                itemBuilder: (context, index) {
                  final movieData = recommendedMovies[index];
                  final movie = MovieModel(
                    title: movieData['title'],
                    rating: movieData['rating'],
                    genre: movieData['genre'],
                    year: movieData['year'],
                    duration: movieData['duration'],
                    imageUrl: movieData['imageUrl'],
                  );

                  return MovieCard2(
                    title: movie.title,
                    rating: movie.rating,
                    genre: movie.genre,
                    year: movie.year,
                    duration: movie.duration,
                    imageUrl: movie.imageUrl,
                    onFavoritePressed: () {
                      _addToFavorites(movie, context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
