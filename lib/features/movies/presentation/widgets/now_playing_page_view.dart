import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_states.dart';
import 'package:movie_app/features/movies/presentation/widgets/now_playing_item.dart';

class NowPlayingPageView extends StatelessWidget {
  const NowPlayingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.isloading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.isloaded:
            return SizedBox(
              height: 350,
              child: PageView.builder(
                itemCount: state.nowPlayingMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.nowPlayingMovies[index];
                  return NowPlayingItem(movie: movie);
                },
              ),
            );
          case RequestState.error:
            return Center(child: Text(state.nowPlayingMessage));
        }
      },
    );
  }
}
