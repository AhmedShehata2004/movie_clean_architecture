import 'package:dio/dio.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();   
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNjEzNzI3MGRlZjEzYmZkNTczM2RhOGI0ZmE4NDUwMiIsIm5iZiI6MTc5MzEwMjczOS44MzYsInN1YiI6IjZhZTA5MzkzYWE3ODAwYmRlYmQ1OGM5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4tai11HrQhJO-SownPOdljX40mHg0T8iG97DOmaZH3M";
  
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      'https://api.themoviedb.org/3/movie/now_playing',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      print('Failed to load now playing movies: ${response.statusCode}');
      throw Exception('Failed to load now playing movies');
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(
      'https://api.themoviedb.org/3/movie/popular',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      print('Failed to load popular movies: ${response.statusCode}');
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
      'https://api.themoviedb.org/3/movie/top_rated',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      print('Failed to load top rated movies: ${response.statusCode}');
      throw Exception('Failed to load top rated movies');
    }
  }


 
}


