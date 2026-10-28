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
        body: CustomScrollView(
          slivers: [
            // --- 1. الـ BlocBuilder الخاص بتفاصيل الفيلم (AppBar + Details Info فقط) ---
            BlocBuilder<MovieDatailsBloc, MovieDetailsStates>(
              buildWhen: (previous, current) =>
                  previous.movieDetailsState != current.movieDetailsState ||
                  previous.movieDetail != current.movieDetail,
              builder: (context, state) {
                switch (state.movieDetailsState) {
                  case RequestState.isloading:
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );

                  case RequestState.error:
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          state.movieDetailsMessage,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );

                  case RequestState.isloaded:
                    final movie = state.movieDetail!;
                    return SliverMainAxisGroup(
                      slivers: [
                        // الـ AppBar الخاص بالفيلم
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
                              AppConstance.imageUrl(movie.imageUrl),
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

                        // تفاصيل الفيلم النصية
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                _buildMovieInfoRow(movie),
                                const SizedBox(height: 16),
                                Text(
                                  movie.overview,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  movie.genres
                                      .map((genre) => genre.name)
                                      .join(' , '),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                }
              },
            ),

            // --- 2. الـ BlocBuilder الخاص بالـ Recommendations لوحدها في الأسفل ---
            SliverToBoxAdapter(
              child: BlocBuilder<MovieDatailsBloc, MovieDetailsStates>(
                buildWhen: (previous, current) =>
                    previous.recommendationMoviesState !=
                        current.recommendationMoviesState ||
                    previous.recommendationMovies !=
                        current.recommendationMovies,
                builder: (context, state) {
                  switch (state.recommendationMoviesState) {
                    case RequestState.isloading:
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case RequestState.isloaded:
                      return RecommendationsSection(
                        recommendationMovies: state.recommendationMovies,
                      );
                    case RequestState.error:
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            state.recommendationMoviesMessage,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
          ],
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
            movieDetails.releaseDate,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        Text(
          movieDetails.voteAverage.toStringAsFixed(1),
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(width: 16),
        Text(
          movieDetails.runtime.toString(),
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}