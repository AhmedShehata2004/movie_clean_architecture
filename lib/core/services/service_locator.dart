import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/data/datasource/movie_data_source.dart';
import 'package:movie_app/features/movies/data/repo/movie_repo.dart';
import 'package:movie_app/features/movies/domain/repo/base_movie_repo.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/features/movies/domain/usecases/get_recommendation_movies.dart';
import 'package:movie_app/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_datails_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(
      () => MovieDatailsBloc(
        getMovieDetailsUseCase: sl(),
        getRecommendationMoviesUseCase: sl(),
      ),
    );

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(
      () => GetRecommendationMoviesUseCase(baseMovieRepo: sl()),
    );

    /// Repository
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
