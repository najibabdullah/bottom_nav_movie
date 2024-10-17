class MovieModel {
  final int? id;
  final String title;
  final double rating;
  final String genre;
  final int year;
  final String duration;
  final String imageUrl;
  

  MovieModel({
    this.id,
    required this.title,
    required this.rating,
    required this.genre,
    required this.year,
    required this.duration,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'genre': genre,
      'year': year,
      'duration': duration,
      'imageUrl': imageUrl,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      rating: map['rating'],
      genre: map['genre'],
      year: map['year'],
      duration: map['duration'],
      imageUrl: map['imageUrl'],
    );
  }
}
