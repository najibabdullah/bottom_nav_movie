import 'package:bottom_nav_movie/model/modelfav.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseController extends GetxController {
  static final DatabaseController _instance = DatabaseController._internal();
  static Database? _database;

  factory DatabaseController() {
    return _instance;
  }

  DatabaseController._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        rating REAL,
        genre TEXT,
        year INTEGER,
        duration TEXT,
        imageUrl TEXT
      )
    ''');
  }

  Future<int> addFavorite(MovieModel movie) async {
    Database db = await database;
    return await db.insert('favorites', movie.toMap());
  }

  Future<int> removeFavorite(String title) async {
    Database db = await database;
    return await db.delete('favorites', where: 'title = ?', whereArgs: [title]);
  }

  Future<List<MovieModel>> getFavoriteMovies() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return MovieModel.fromMap(maps[i]);
    });
  }

  Future<bool> isFavorite(String title) async {
    Database db = await database;
    var result =
        await db.query('favorites', where: 'title = ?', whereArgs: [title]);
    return result.isNotEmpty;
  }
}
