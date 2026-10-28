import 'package:movie_app/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({required super.title, required super.imageUrl, required super.id, required super.overview, required super.releaseDate, required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['title'],
        imageUrl: json['poster_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
      );

}
