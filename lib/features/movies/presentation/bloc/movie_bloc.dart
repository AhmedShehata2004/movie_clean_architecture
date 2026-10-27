import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_events.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUseCase getPopularMoviesUsecase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUsecase;
  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        // copyWith method is used to create a new state with updated values while keeping the other values unchanged.
        // donot use moviestate constructor directly because it will reset the other values to their default values.
        // copywith better than constructor because it will keep the other values unchanged. and donot make new state with default values.
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

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        // copyWith method is used to create a new state with updated values while keeping the other values unchanged.
        // donot use moviestate constructor directly because it will reset the other values to their default values.
        // copywith better than constructor because it will keep the other values unchanged. and donot make new state with default values.
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: failure.message,
        ),
      ),
      (popularMoviesList) => emit(
        state.copyWith(
          popularMovies: popularMoviesList,
          popularState: RequestState.isloaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold(
      (failure) => emit(
        // copyWith method is used to create a new state with updated values while keeping the other values unchanged.
        // donot use moviestate constructor directly because it will reset the other values to their default values.
        // copywith better than constructor because it will keep the other values unchanged. and donot make new state with default values.
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: failure.message,
        ),
      ),
      (topRatedMoviesList) => emit(
        state.copyWith(
          topRatedMovies: topRatedMoviesList,
          topRatedState: RequestState.isloaded,
        ),
      ),
    );
  }
}
