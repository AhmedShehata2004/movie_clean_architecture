import 'package:equatable/equatable.dart';

class Movie extends Equatable {
 final String title;
  final String imageUrl;
  final int id;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  const Movie({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        title,
        imageUrl,
        id,
        
        overview,
        releaseDate ,
        voteAverage,
      ];
}
