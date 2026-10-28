import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/domain/repo/base_movie_repo.dart';

class GetMovieDetailsUseCase extends BaseUsecase<MovieDetails,MovieDetailsParameters> {

  BaseMovieRepo baseMovieRepo;
  GetMovieDetailsUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameter) async{

    return await baseMovieRepo.getMovieDetails(parameter);
}
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}