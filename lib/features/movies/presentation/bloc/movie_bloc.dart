import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_events.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_states.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  MovieBloc(this.getNowPlayingMoviesUsecase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.message,
        ),
      ),
      (nowPlayingMoviesList) => emit(
        state.copyWith(
          nowPlayingMovies: nowPlayingMoviesList,
          nowPlayingState: RequestState.isloaded,
        ),
      ),
    );
  }
}
