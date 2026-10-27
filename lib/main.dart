import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentation/screens/home_screen.dart';

void main() {
  DevicePreview.enable();

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}

// class HomeScreennn extends StatefulWidget {
//   const HomeScreennn({super.key});

//   @override
//   State<HomeScreennn> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreennn> {
//   // 1. استخدام نوع الـ Entity (Movie) وليس Model
//   List<Movie> moviesList = [];
//   bool isLoading = true;
//   String errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     // 2. استدعاء الداتا أول ما الشاشة تفتح
//     fetchMovies();
//   }

//   void fetchMovies() async {
//     try {
//       // 3. بناء الـ Dependencies يدوياً (Manual Dependency Injection)
//       BaseMovieRemoteDataSource remoteDataSource = MovieRemoteDataSource();
//       MovieRepo movieRepo = MovieRepo(remoteDataSource);
//       GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase =
//           GetNowPlayingMoviesUsecase(movieRepo);

//       // 4. جلب الداتا من الـ UseCase
//       final result = await getNowPlayingMoviesUsecase(NoParameters());

//       result.fold(
//         (failure) {
//           // الحالة الأولى: حصل خطأ (Left)
//           print('❌ Error: $failure');
//           setState(() {
//             errorMessage = failure.toString();
//             isLoading = false;
//           });
//         },
//         (r) {
//           // الحالة الثانية: الداتا رجعت بنجاح (Right)
//           print('✅ Success! Fetched ${r.length} movies');
//           setState(() {
//             moviesList = r; // حفظ الـ List بنجاح بدون Shadowing
//             isLoading = false;
//           });
//         },
//       );
//     } catch (e) {
//       print('❌ Catch Error: $e');
//       setState(() {
//         errorMessage = e.toString();
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Now Playing Movies (Clean Arch)'),
//         centerTitle: true,
//       ),
//       body: _buildBody(),
//     );
//   }

//   // دالة لتنظيم الـ UI بناءً على الحالة (Loading, Error, Success)
//   Widget _buildBody() {
//     // الحالة الأولى: جاري التحميل
//     if (isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     // الحالة الثانية: حدث خطأ (مع فحص آمن للنص)
//     if (errorMessage.trim().isNotEmpty) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Error: $errorMessage',
//             style: const TextStyle(color: Colors.red, fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       );
//     }

//     // الحالة الثالثة: الداتا رجعت فاضية
//     if (moviesList.isEmpty) {
//       return const Center(
//         child: Text('No movies found!'),
//       );
//     }

//     // الحالة الرابعة: الداتا رجعت بنجاح ونعرضها في ListView
//     return ListView.builder(
//       itemCount: moviesList.length,
//       itemBuilder: (context, index) {
//         final movie = moviesList[index];
//         return Card(
//           margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           child: ListTile(
//             leading: movie.imageUrl != null && movie.imageUrl!.isNotEmpty
//                 ? Image.network(
//                     'https://image.tmdb.org/t/p/w500${movie.imageUrl}',
//                     width: 50,
//                     fit: BoxFit.cover,
//                   )
//                 : const Icon(Icons.movie),
//             title: Text(
//               movie.title ?? 'No Title',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }