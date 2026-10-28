import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/features/movies/domain/entities/recommendation.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key, required this.recommendationMovies});
  final List<Recommendation> recommendationMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "More Like This",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildMoreLikeThisGrid(recommendationMovies),
      ],
    );
  }
}

Widget _buildMoreLikeThisGrid(List<Recommendation> recommendationMovies) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      childAspectRatio: 0.65,
    ),
    itemCount: recommendationMovies.length,
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          AppConstance.imageUrl(recommendationMovies[index].image!),
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[850],
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.grey),
            ),
          ),
        ),
      );
    },
  );
}
