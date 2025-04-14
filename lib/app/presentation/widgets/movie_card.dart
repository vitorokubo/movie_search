import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/app/data/models/movie_model.dart';
import 'package:movie_search/app/domain/bloc/previous_search%20copy/details_movie_event.dart';
import 'package:movie_search/app/domain/bloc/previous_search%20copy/details_movies_bloc.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_event.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_bloc.dart';
import 'package:movie_search/app/domain/services/movie_service.dart';
import 'package:movie_search/app/presentation/widgets/movie_detail_dialog.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final MovieService movieService;
  final bool showDetailsButton;

  const MovieCard({
    super.key,
    required this.movie,
    required this.movieService,
    this.showDetailsButton = true,
  });

  Future<void> _handleVerDetalhes(BuildContext context) async {
    try {
      final movieDetalhado = await movieService.filmeDetalhe(movie);

      if (!context.mounted) return;

      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => MovieDetailDialog(movie: movieDetalhado),
      );

      if (!context.mounted) return;

      context.read<DetailsMoviesBloc>().add(SearchDetailsMovie(movieDetalhado));
      context.read<RecentMoviesBloc>().add(GetRecentMovies());
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao buscar detalhes do filme')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE9E6E1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _handleVerDetalhes(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SizedBox(
                height: 180,
                child: Image.network(
                  movie.poster,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 64,
                        color: Color(0xFFF0BB78),
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF543A14), 
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ano: ${movie.year}',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF543A14),
                    ),
                  ),
                  const SizedBox(height: 8),

                  if (showDetailsButton)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF0BB78),
                          foregroundColor: Color(0xFF131010),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: () => _handleVerDetalhes(context),
                        child: const Text('Ver detalhes'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
