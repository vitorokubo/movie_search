import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/app/domain/bloc/movie_search/movie_search_bloc.dart';
import 'package:movie_search/app/domain/bloc/movie_search/movie_search_event.dart';
import 'package:movie_search/app/domain/bloc/movie_search/movie_search_state.dart';
import 'package:movie_search/app/domain/services/movie_service.dart';
import 'package:movie_search/app/presentation/widgets/movie_card.dart';

class MovieSearchPage extends StatefulWidget {
  final MovieService movieService;

  const MovieSearchPage({super.key, required this.movieService});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  final _controller = TextEditingController();

  void _buscarFilme() {
    final texto = _controller.text;
    if (texto.isNotEmpty) {
      context.read<MovieSearchBloc>().add(BuscarFilme(texto));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Filme')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Buscar filme',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    onSubmitted: (_) => _buscarFilme(),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _buscarFilme,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Icon(Icons.search, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieSearchSuccess) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.filmes.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.7,
                          ),
                      itemBuilder: (context, index) {
                        final movie = state.filmes[index];
                        return MovieCard(
                          movie: movie,
                          movieService: widget.movieService,
                        );
                      },
                    );
                  } else if (state is MovieSearchError) {
                    return Center(child: Text(state.mensagem));
                  }

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.movie_filter, size: 64, color: Colors.grey),
                        SizedBox(height: 12),
                        Text(
                          'Digite o nome de um filme para buscar',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
