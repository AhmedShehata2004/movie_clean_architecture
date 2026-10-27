import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_events.dart';
import 'package:movie_app/features/movies/presentation/widgets/now_playing_page_view.dart';
import 'package:movie_app/features/movies/presentation/widgets/popular_movies_section.dart';
import 'package:movie_app/features/movies/presentation/widgets/top_rated_movies_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()..add(GetNowPlayingMoviesEvent()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                NowPlayingPageView(),
                SizedBox(height: 16),
                PopularMoviesSection(),
                SizedBox(height: 16),
                TopRatedMoviesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
