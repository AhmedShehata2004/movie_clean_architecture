import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';

/*
تقدر تغير أسماء T و parameters بأي أسامي تانية تعجبك
، لأن دي مجرد متغيرات وهمية 
(Placeholders أو Type Parameters) أنت اللي بتحددهم وقت كتابة الكود.
*/
abstract class BaseUsecase <T , parameters > { 
  Future<Either<Failure, T>> call( parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}