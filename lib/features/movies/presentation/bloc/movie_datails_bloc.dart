// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';

import 'package:movie_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_details_events.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_details_states.dart';

class MovieDatailsBloc extends Bloc<MovieDetailsEvents, MovieDetailsStates> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDatailsBloc({required this.getMovieDetailsUseCase})
    : super(const MovieDetailsStates()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsStates> emit,
  ) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameters(movieId: event.id),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: failure.message,
        ),
      ),
      (sucess) => emit(
        state.copyWith(
          movieDetail: sucess,
          movieDetailsState: RequestState.isloaded,
        ),
      ),
    );
  }
}
