import 'package:flutter/material.dart';

class MovieCard2 extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final String genre;
  final int year;
  final String duration;
  final VoidCallback onFavoritePressed;
  final bool isInitiallyFavorite;
  final bool isFavoriteScreen;

  MovieCard2({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.genre,
    required this.year,
    required this.duration,
    required this.onFavoritePressed,
    this.isInitiallyFavorite = false,
    this.isFavoriteScreen = false,
  });

  @override
  _MovieCard2State createState() => _MovieCard2State();
}

class _MovieCard2State extends State<MovieCard2> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isInitiallyFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Smoother edges
      ),
      elevation: 6, // Increase shadow depth
      margin: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 10), // Increase margin
      color: Colors.grey[850], // Darker background for contrast
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Movie Poster with rounded edges
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              widget.imageUrl,
              width: double.infinity,
              height: 240, // Increased poster height for better emphasis
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Movie Title
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                _buildMovieDetailRow(
                    '⭐', '${widget.rating.toStringAsFixed(1)}'),
                _buildMovieDetailRow('🎫', widget.genre),
                _buildMovieDetailRow('📅', widget.year.toString()),
                _buildMovieDetailRow('⏳', widget.duration),
              ],
            ),
          ),
          Container(
            width: 170,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.isFavoriteScreen
                    ? Colors.red
                    : (isFavorite
                        ? Colors.yellow
                        : Colors.white), // Border color based on the icon state
                width: 2.0,
                // Border width
              ),
              borderRadius: BorderRadius.circular(4),
              // Small or zero value for rectangular border
            ),
            child: IconButton(
              icon: widget.isFavoriteScreen
                  ? const Icon(Icons.delete, color: Colors.red)
                  : Icon(
                      isFavorite ? Icons.bookmark : Icons.bookmark_border,
                      color: isFavorite ? Colors.yellow : Colors.white,
                    ),
              onPressed: () {
                setState(() {
                  if (!widget.isFavoriteScreen) {
                    isFavorite = !isFavorite;
                  }
                });
                widget.onFavoritePressed();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build movie detail rows (e.g., Rating, Genre, etc.)
  Widget _buildMovieDetailRow(String icon, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            detail,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
