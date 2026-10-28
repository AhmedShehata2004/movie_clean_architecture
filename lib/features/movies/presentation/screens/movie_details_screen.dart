import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentation/widgets/recommendations_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  // يمكنك استقبال الـ Movie ID لاستدعائه من الـ API، أو استقبال الـ Object مباشرة
  // final int movieId;

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E28),
      body: CustomScrollView(
        slivers: [
          _buildTopSection(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // عنوان الفيلم
                  const Text(
                    "Turning Red", // استبدلها بـ movieDetail.title
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // معلومات سريعة (السنة، التقييم، المدة)
                  _buildMovieInfoRow(),
                  const SizedBox(height: 16),

                  // القصة (Overview)
                  const Text(
                    "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.", // استبدلها بـ movieDetail.description
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // التصنيفات (Genres)
                  const Text(
                    "Genres: Animation, Family, Comedy, Fantasy", // استبدلها بالداتا الجاية من الـ API
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 24),

                  RecommendationsSection(), // قسم الأفلام المشابهة
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- تصميم القسم العلوي (الصورة والزر) ---
  Widget _buildTopSection(BuildContext context) {
    return SliverAppBar(
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
          'https://image.tmdb.org/t/p/w500/path_to_backdrop.jpg', // استبدلها بـ رابط الصورة من الـ API
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[900],
            child: const Icon(Icons.movie, color: Colors.white, size: 50),
          ),
        ),
      ),
    );
  }

  // --- صف المعلومات السريعة (السنة، التقييم، المدة) ---
  Widget _buildMovieInfoRow() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            "2022", // سنة الإنتاج
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        const Text(
          "3.8", // التقييم
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(width: 16),
        const Text(
          "1h 40m", 
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}
