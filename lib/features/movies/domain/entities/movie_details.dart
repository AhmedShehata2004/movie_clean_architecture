import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movies/domain/entities/genre.dart';

class MovieDetails extends Equatable {
  final String title;
  final String imageUrl;
  final int id;
  final int runtime;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final List<Genre> genres;
  
  const MovieDetails({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.runtime,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        title,
        imageUrl,
        id,
        runtime,
        overview,
        releaseDate,
        voteAverage,
        genres,
      ];

}