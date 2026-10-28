import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';

class MovieDetailsStates extends Equatable {
  final MovieDetails? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  const MovieDetailsStates({
    this.movieDetail,
    this.movieDetailsMessage = "",
    this.movieDetailsState = RequestState.isloading,
  });

  MovieDetailsStates copyWith({
    MovieDetails? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsStates(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
    );
  }

  @override
  List<Object?> get props => [
    movieDetail,
    movieDetailsMessage,
    movieDetailsState,
  ];
}
