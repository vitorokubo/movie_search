import 'dart:convert';

class MovieModel {
  final String title;
  final String year;
  final String poster;
  final String imdbID;
  final String genre;
  final String plot;
  final String director;

  MovieModel({
    required this.title,
    required this.year,
    required this.poster,
    required this.imdbID,
    this.genre = '',
    this.plot = '',
    this.director = '',
  });

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['Title'] ?? '',
      year: map['Year'] ?? '',
      poster: map['Poster'] ?? '',
      imdbID: map['imdbID'] ?? '',

      genre: map['Genre'] ?? '',
      plot: map['Plot'] ?? '',
      director: map['Director'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'Title': title,
      'Year': year,
      'Poster': poster,
      'Genre': genre,
      'Plot': plot,
    };
  }
}
