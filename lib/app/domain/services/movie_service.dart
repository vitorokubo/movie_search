import 'package:movie_search/app/data/models/movie_model.dart';
import 'package:movie_search/app/data/repositories/movie_repository.dart';

class MovieService {
  final MovieRepository movieRepository;

  MovieService(this.movieRepository);

  Future<List<MovieModel>> buscarFilmes(String titulo) async {
    try {
      final movies = await movieRepository.fetchMovies(titulo);

      return movies
          .map<MovieModel>((movie) => MovieModel.fromMap(movie))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar filmes: $e');
    }
  }

  Future<MovieModel> filmeDetalhe(MovieModel movie) async {
    try {
      final json = await movieRepository.fetchMovieDetail(movie.imdbID);
      return MovieModel.fromMap(json);
    } catch (e) {
      throw Exception('Erro ao buscar detalhes do filme: $e');
    }
  }
}
