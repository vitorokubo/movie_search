import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/app/domain/bloc/movie_search/movie_search_bloc.dart';
import 'package:movie_search/app/domain/bloc/previous_search%20copy/details_movies_bloc.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_bloc.dart';
import 'package:movie_search/app/domain/services/local_storage_service.dart';
import 'package:movie_search/app/domain/services/movie_service.dart';
import 'package:movie_search/app/presentation/screens/movie_search_screen.dart';
import 'package:movie_search/app/presentation/screens/previous_search_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainNavigation extends StatefulWidget {
  final MovieService movieService;
  final LocalStorageService localStorageService;

  const MainNavigation({
    super.key,
    required this.movieService,
    required this.localStorageService,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MovieSearchBloc(widget.movieService)),
        BlocProvider(
          create:
              (_) => RecentMoviesBloc(
                widget.localStorageService,
                widget.movieService,
              ),
        ),
        BlocProvider(
          create:
              (_) => DetailsMoviesBloc(
                widget.localStorageService,
                widget.movieService,
              ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie_creation, size: 28, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                'Encontre os filmes que você ama!',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.amber,
          elevation: 4,
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child:
              _selectedIndex == 0
                  ? MovieSearchPage(movieService: widget.movieService)
                  : PreviousSearchPage(movieService: widget.movieService),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: theme.colorScheme.primary,
          buttonBackgroundColor: theme.colorScheme.secondary,
          backgroundColor: theme.scaffoldBackgroundColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          items: <Widget>[
            Icon(Icons.search, size: 30, color: theme.iconTheme.color),
            Icon(Icons.history, size: 30, color: theme.iconTheme.color),
          ],

          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}
