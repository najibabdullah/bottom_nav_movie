import 'package:bottom_nav_movie/component/array_home.dart';
import 'package:bottom_nav_movie/model/model_card.dart';
import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:bottom_nav_movie/widget/mygambar.dart';
import 'package:bottom_nav_movie/widget/myposter.dart';
import 'package:flutter/material.dart';

class Homemenu extends StatelessWidget {
  final List<ModelCard> movieCategories = [
    ModelCard(Icons.play_circle_fill, Colors.redAccent, 'Now Playing', () {}),
    ModelCard(Icons.upcoming, Colors.blueAccent, 'Upcoming', () {}),
    ModelCard(Icons.star_rate, Colors.yellowAccent, 'Top Rated', () {}),
    ModelCard(Icons.trending_up, Colors.greenAccent, 'Popular', () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: asikkcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Home"),
        automaticallyImplyLeading: false,
        foregroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What do you want to watch?',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  final movie = movieList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: MoviePoster(
                          imageUrl: movie['imageUrl']!,
                          title: movie['title']!,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 480,
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieCategories.length,
                itemBuilder: (context, index) {
                  final movieCategory = movieCategories[index];
                  return ElevatedButton.icon(
                    onPressed: movieCategory.onPressed,
                    icon: Icon(movieCategory.icon, color: movieCategory.color),
                    label: Text(movieCategory.text),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: primaryColor,
                      backgroundColor: asikkcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1,
                ),
                itemCount: gridMovieList.length,
                itemBuilder: (context, index) {
                  final imageUrl = gridMovieList[index];
                  return MovieGambar(
                    imageUrl: imageUrl,
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
