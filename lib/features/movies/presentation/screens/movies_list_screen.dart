import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_details_card.dart';

class MoviesListScreen extends StatelessWidget {
  final String screenTitle;

  const MoviesListScreen({
    super.key,
    required this.screenTitle,
    required this.movieModel,
  });
  final List<Movie> movieModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 39, 2),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            screenTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: movieModel.length,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailsScreen(movieId: movieModel[index].id),
                ),
              ),
              child: CustomMovieCard(movie: movieModel[index]),
            );
          },
        ),
      ),
    );
  }
}
