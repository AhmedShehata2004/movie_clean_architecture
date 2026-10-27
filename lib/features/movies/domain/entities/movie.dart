import 'package:equatable/equatable.dart';

class Movie extends Equatable {
 final String title;
  final String imageUrl;

  const Movie({required this.title, required this.imageUrl});

  @override
  List<Object?> get props => [title, imageUrl];
}
