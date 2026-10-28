// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';

import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/features/movies/domain/entities/recommendation.dart';
import 'package:movie_app/features/movies/domain/repo/base_movie_repo.dart';

class GetRecommendationMoviesUseCase extends BaseUsecase<List<Recommendation>,RecommendationMoiveParameters> {
  BaseMovieRepo baseMovieRepo ;
  GetRecommendationMoviesUseCase({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationMoiveParameters parameters) async{
   return await baseMovieRepo.getRecommendationMovies(parameters);
  }
  
}


class RecommendationMoiveParameters extends Equatable {
  final int movieId;

  const RecommendationMoiveParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}