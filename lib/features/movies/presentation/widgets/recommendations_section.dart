import 'package:flutter/material.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

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
        _buildMoreLikeThisGrid(),
      ],
    );
  }
}


 Widget _buildMoreLikeThisGrid() {
    // افترض أن لديك لستة أفلام مشابهة قادمة من الـ API (شبيهة بـ recommendations)
    final int itemCount = 6; // عدد العناصر التجريبي، استبدله بـ list.length

    return GridView.builder(
      shrinkWrap: true, // مهم جداً لأن الـ GridView جوه SingleChildScrollView/Sliver
      physics: const NeverScrollableScrollPhysics(), // تعطيل السكرول الداخلي لتعمل بانسيابية مع الشاشة
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 أفلام في كل صف مثل الصورة
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65, // نسبة الطول للعرض الخاصة ببوستر الفيلم
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/path_to_poster.jpg', // رابط بوستر الفيلم المشابه من الـ API
            fit: BoxFit.cover,
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