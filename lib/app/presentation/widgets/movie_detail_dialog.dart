import 'package:flutter/material.dart';
import 'package:movie_search/app/data/models/movie_model.dart';

class MovieDetailDialog extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailDialog({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32), 
                  Center(
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (movie.poster.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 300,
                        child: Image.network(
                          movie.poster,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 8),
                      Text('Ano: ${movie.year}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (movie.genre.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.category, size: 18),
                        const SizedBox(width: 8),
                        Expanded(child: Text('Gênero: ${movie.genre}')),
                      ],
                    ),
                  const SizedBox(height: 10),
                  if (movie.director.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.movie_creation_outlined, size: 18),
                        const SizedBox(width: 8),
                        Expanded(child: Text('Diretor: ${movie.director}')),
                      ],
                    ),
                  const Divider(height: 32),
                  Text(
                    'Sinopse',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.plot,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
