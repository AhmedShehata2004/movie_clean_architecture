import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/movies/data/models/movie_details_model.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_details_card.dart';

class MoviesListScreen extends StatelessWidget {
  final String screenTitle;

  const MoviesListScreen({super.key, required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    // قائمة بيانات وهمية (Mock Data) لدعم الديناميكية
    final List<MovieDetailsModel> movies = [
      MovieDetailsModel(
        title: "Demon Slayer - Kimetsu no Yaiba",
        imageUrl: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
        year: "2020",
        rating: 4.2,
        description: "Tanjiro Kamado, joined with Inosuke Hashibira, a boy raised by boars who...",
      ),
      MovieDetailsModel(
        title: "Hotel Transylvania: Transformania",
        imageUrl: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
        year: "2022",
        rating: 3.5,
        description: "When Van Helsing's mysterious invention, the 'Monsterification Ray', goes haywire, ...",
      ),
      MovieDetailsModel(
        title: "Moonbound",
        imageUrl: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
        year: "2021",
        rating: 3.0,
        description: "When Peter sets out on a magical journey to rescue his little sister Anne, he needs t...",
      ),
      MovieDetailsModel(
        title: "Chip 'n Dale: Rescue Rangers",
        imageUrl: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
        year: "2022",
        rating: 3.6,
        description: "Decades since their successful television series was canceled, Chip has ...",
      ),

       MovieDetailsModel(
        title: "Chip 'n Dale: Rescue Rangers",
        imageUrl: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
        year: "2022",
        rating: 3.6,
        description: "Decades since their successful television series was canceled, Chip has ...",
      ),
       MovieDetailsModel(
        title: "Chip 'n Dale: Rescue Rangers",
        imageUrl: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
        year: "2022",
        rating: 3.6,
        description: "Decades since their successful television series was canceled, Chip has ...",
      ),
       MovieDetailsModel(
        title: "Chip 'n Dale: Rescue Rangers",
        imageUrl: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
        year: "2022",
        rating: 3.6,
        description: "Decades since their successful television series was canceled, Chip has ...",
      ),

    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor, 
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 39, 2),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
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
          itemCount: movies.length,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemBuilder: (context, index) {
            return CustomMovieCard(movie: movies[index]);
          },
        ),
      ),
    );
  }
}