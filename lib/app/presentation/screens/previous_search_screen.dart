import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_event.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_state.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_bloc.dart';
import 'package:movie_search/app/domain/services/movie_service.dart';
import 'package:movie_search/app/presentation/widgets/movie_card.dart';

class PreviousSearchPage extends StatefulWidget {
  final MovieService movieService;

  const PreviousSearchPage({super.key, required this.movieService});

  @override
  State<PreviousSearchPage> createState() => _PreviousSearchPageState();
}

class _PreviousSearchPageState extends State<PreviousSearchPage> {
  @override
  void initState() {
    super.initState();
    context.read<RecentMoviesBloc>().add(GetRecentMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filmes Recentes')),
      body: BlocBuilder<RecentMoviesBloc, RecentMoviesState>(
        builder: (context, state) {
          if (state is RecentMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is RecentMoviesListSucess) {
            final filmes = state.filmesRecentes;

            if (filmes.isEmpty) {
              return const Center(child: Text('Nenhum filme recente'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: filmes.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final movie = filmes[index];
                return MovieCard(
                  movie: movie,
                  movieService: widget.movieService,
                );
              },
            );
          }

          return const Center(child: Text('Erro desconhecido'));
        },
      ),
    );
  }
}
