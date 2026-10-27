import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/movies/presentation/widgets/now_playing_page_view.dart';
import 'package:movie_app/features/movies/presentation/widgets/popular_movies_section.dart';
import 'package:movie_app/features/movies/presentation/widgets/top_rated_movies_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: AppColors.backgroundColor,
        // appBar: AppBar(
        //   title: Text('Movie App'),
        //   centerTitle: true,
        //   backgroundColor: Colors.amber,
        // ),
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
    );
  }
}