import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? image;
  final int id;

  const Recommendation({this.image, required this.id});

  @override
  List<Object?> get props => [image , id];
}