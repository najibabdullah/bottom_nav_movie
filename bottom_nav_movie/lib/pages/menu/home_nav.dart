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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0), // Horizontal padding for spacing
                    child: InkWell(
                      onTap: () {
                        // Add onTap functionality if needed
                      },
                      child: Container(
                        width: 180, // Set a fixed width for movie cards
                        decoration: BoxDecoration(
                          color:
                              Colors.grey[850], // Background color for the card
                          borderRadius:
                              BorderRadius.circular(15), // Smooth edges
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Subtle shadow
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset:
                                  Offset(0, 3), // Controls the shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Movie Poster Image
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                movie['imageUrl']!,
                                height: 200, // Height for the image
                                width: double.infinity,
                                fit: BoxFit.cover, // Ensure the image fits well
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                movie['title']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                maxLines: 2, // Limit title to two lines
                                overflow: TextOverflow
                                    .ellipsis, // Ellipsis if title is too long
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 80, 143, 168),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 38, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                // Action for "Watch Now"
                              },
                              child: Text(
                                'Watch Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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
                  crossAxisCount: 3, // 3 posters per row
                  crossAxisSpacing: 10.0, // space between columns
                  mainAxisSpacing: 10.0, // space between rows
                  childAspectRatio: 0.7, // Adjust ratio for a taller appearance
                ),
                itemCount: gridMovieList.length,
                itemBuilder: (context, index) {
                  final movielist = gridMovieList[index];
                  return Card(
                    color: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded edges
                    ),
                    elevation: 5, // Adds shadow for elevation effect
                    shadowColor:
                        Colors.black.withOpacity(0.3), // Subtle shadow color
                    child: Stack(
                      // Stack for layering poster and overlay
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: MovieGambar(
                              imageUrl: movielist['imageUrl']!,
                              title: movielist['title']!,
                            ),
                          ),
                        ),
                        // Rating badge or "Watch Now" button overlay
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 80, 143, 168),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 38, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Action for "Watch Now"
                            },
                            child: Text(
                              'Watch Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
