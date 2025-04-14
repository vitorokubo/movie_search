import 'package:movie_search/app/data/models/movie_model.dart';

abstract class MovieSearchState {}

class MovieInitial extends MovieSearchState {}

class MovieLoading extends MovieSearchState {}

class MovieSearchSuccess extends MovieSearchState {
  final List<MovieModel> filmes;
  MovieSearchSuccess(this.filmes);
}

class MovieSearchError extends MovieSearchState {
  final String mensagem;
  MovieSearchError(this.mensagem);
}
