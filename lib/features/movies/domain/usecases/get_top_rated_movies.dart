import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/repo/base_movie_repo.dart';

class GetTopRatedMoviesUseCase extends BaseUsecase <List<Movie>, NoParameters> {
  final BaseMovieRepo baseMovieRepo;
  GetTopRatedMoviesUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}