import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/domain/entities/recommendation.dart';

class MovieDetailsStates extends Equatable {
  final MovieDetails? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendationMovies;
  final RequestState recommendationMoviesState;
  final String recommendationMoviesMessage;

  const MovieDetailsStates({
    this.movieDetail,
    this.movieDetailsMessage = "",
    this.movieDetailsState = RequestState.isloading,
    this.recommendationMovies = const [],
    this.recommendationMoviesMessage = "",
    this.recommendationMoviesState = RequestState.isloading,
  });

  MovieDetailsStates copyWith({
    MovieDetails? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendationMovies,
    RequestState? recommendationMoviesState,
    String? recommendationMoviesMessage,
  }) {
    return MovieDetailsStates(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendationMovies: recommendationMovies ?? this.recommendationMovies,
      recommendationMoviesState:
          recommendationMoviesState ?? this.recommendationMoviesState,
      recommendationMoviesMessage:
          recommendationMoviesMessage ?? this.recommendationMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetail,
    movieDetailsMessage,
    movieDetailsState,
    recommendationMovies,
    recommendationMoviesState,
    recommendationMoviesMessage,
  ];
}
