import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentation/widgets/now_playing_item.dart';

class NowPlayingPageView extends StatelessWidget {
  const NowPlayingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: PageView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const NowPlayingItem();
        },
      ),
    );
  }
}
