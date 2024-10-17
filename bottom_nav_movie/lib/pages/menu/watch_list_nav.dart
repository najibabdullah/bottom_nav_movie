import 'package:bottom_nav_movie/controllers/databasecontroler.dart';
import 'package:bottom_nav_movie/model/modelfav.dart';
import 'package:bottom_nav_movie/widget/mycard2.dart';
import 'package:bottom_nav_movie/widget/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchListmenu extends StatefulWidget {
  const WatchListmenu({super.key});

  @override
  _WatchListmenuState createState() => _WatchListmenuState();
}

class _WatchListmenuState extends State<WatchListmenu> {
  final DatabaseController _dbHelper = DatabaseController();
  late Future<List<MovieModel>> _watchList;

  @override
  void initState() {
    super.initState();
    _loadWatchList();
  }

  void _loadWatchList() {
    setState(() {
      _watchList = _dbHelper.getFavoriteMovies();
    });
  }

  void _removeFromFavorites(String title) async {
    await _dbHelper.removeFavorite(title);
    _loadWatchList();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title removed from favorites!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Watch List"),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: _watchList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading watch list'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('No movies in watchlist',
                    style: TextStyle(color: Colors.white)));
          }

          final favoriteMovies = snapshot.data!;
          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.5,
            ),
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];
              return MovieCard2(
                title: movie.title,
                rating: movie.rating,
                genre: movie.genre,
                year: movie.year,
                duration: movie.duration,
                imageUrl: movie.imageUrl,
                isFavoriteScreen:
                    true, // Mark as Watchlist screen to show delete icon
                onFavoritePressed: () {
                  Get.defaultDialog(
                    title: "Peringatan",
                    titleStyle: TextStyle(
                      fontFamily: 'MontserratBold',
                      fontSize: 18.0,
                      color: secondaryColor,
                    ),
                    middleText:
                        "Kamu yakin ingin menghapus film ini dari favorit?",
                    middleTextStyle: TextStyle(
                      fontFamily: 'MontserratMedium',
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    textConfirm: "Iya",
                    textCancel: "Tidak",
                    onConfirm: () {
                      _removeFromFavorites(
                          movie.title); // Allow removal from favorites
                      Get.back();
                    },
                    onCancel: () {},
                    confirmTextColor: Colors.white,
                    cancelTextColor: secondaryColor,
                    buttonColor: dahscolor,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
