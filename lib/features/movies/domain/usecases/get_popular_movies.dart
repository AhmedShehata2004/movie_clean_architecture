import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/repo/base_movie_repo.dart';

class GetPopularMoviesUseCase extends BaseUsecase<List<Movie>, NoParameters>{
  BaseMovieRepo baseMovieRepo;
  GetPopularMoviesUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await baseMovieRepo.getPopularMovies();
  }

} 