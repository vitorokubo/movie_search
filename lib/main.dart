import 'package:flutter/material.dart';
import 'package:movie_search/app/data/repositories/movie_repository.dart';
import 'package:movie_search/app/domain/services/local_storage_service.dart';
import 'package:movie_search/app/domain/services/movie_service.dart';
import 'package:movie_search/app/presentation/theme/app_theme.dart';
import 'package:movie_search/app/presentation/widgets/navigation_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  final localStorageService = LocalStorageService();
  final movieRepository = MovieRepositoryImpl();
  final movieService = MovieService(movieRepository);
  runApp(
    MyApp(movieService: movieService, localStorageService: localStorageService),
  );
}

class MyApp extends StatelessWidget {
  final MovieService movieService;
  final LocalStorageService localStorageService;

  const MyApp({
    super.key,
    required this.movieService,
    required this.localStorageService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.customLightTheme,
      home: MainNavigation(
        movieService: movieService,
        localStorageService: localStorageService,
      ),
    );
  }
}
