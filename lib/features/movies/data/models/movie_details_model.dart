import 'package:movie_app/features/movies/data/models/genres_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
 const MovieDetailsModel({
    required super.title,
    required super.imageUrl,
    required super.id,
    required super.runtime,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(

        id: json["id"],
        imageUrl: json["backdrop_path"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
      );
}
