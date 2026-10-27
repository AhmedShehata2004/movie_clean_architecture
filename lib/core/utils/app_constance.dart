class AppConstance {
  
  static const String apiKey = "26137270def13bfd5733da8b4fa84502";
  
   static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}