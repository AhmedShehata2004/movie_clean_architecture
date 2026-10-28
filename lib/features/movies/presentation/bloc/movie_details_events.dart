import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvents extends Equatable {
  const MovieDetailsEvents();
}


class GetMovieDetailsEvent extends MovieDetailsEvents {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}


class GetRecommendationMovieEvent extends MovieDetailsEvents {
  final int id;

  const GetRecommendationMovieEvent(this.id);

  @override
  List<Object?> get props => [id];
}
