import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_datails_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_details_events.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_details_states.dart';
import 'package:movie_app/features/movies/presentation/widgets/recommendations_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDatailsBloc>()
        ..add(GetMovieDetailsEvent(movieId))
        ..add(GetRecommendationMovieEvent(movieId)),

      child: Scaffold(
        backgroundColor: const Color(0xFF1E1E28),
        body: BlocBuilder<MovieDatailsBloc, MovieDetailsStates>(
          builder: (context, state) {
            switch (state.movieDetailsState) {
              case RequestState.isloading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.isloaded:
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 300.0,
                      pinned: true,
                      backgroundColor: const Color(0xFF1E1E28),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                          AppConstance.imageUrl(state.movieDetail!.imageUrl),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[900],
                                child: const Icon(
                                  Icons.movie,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movieDetail!.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildMovieInfoRow(state.movieDetail!),
                            const SizedBox(height: 16),
                            Text(
                              state.movieDetail!.overview,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.movieDetail!.genres
                                  .map((genre) => genre.name)
                                  .join(' , '),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: BlocBuilder<MovieDatailsBloc, MovieDetailsStates>(
                        builder: (context, state) {
                          switch (state.recommendationMoviesState) {
                            case RequestState.isloading:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case RequestState.isloaded:
                              return RecommendationsSection(recommendationMovies:state.recommendationMovies);
                             case RequestState.error:
                             return Center(child: Text(state.movieDetailsMessage));

                          }
                        },
                      ),
                    ),
                  ],
                );

              case RequestState.error:
                return Center(child: Text(state.movieDetailsMessage));
            }
          },
        ),
      ),
    );
  }

  Widget _buildMovieInfoRow(MovieDetails movieDetails) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            movieDetails.releaseDate, // سنة الإنتاج
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        Text(
          movieDetails.voteAverage.toStringAsFixed(1), // التقييم
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(width: 16),
        Text(
          movieDetails.runtime.toString(),
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}
