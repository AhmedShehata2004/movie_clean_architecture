import 'package:movie_app/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({required super.title, required super.imageUrl});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['title'],
        imageUrl: json['poster_path'],
      );

}
