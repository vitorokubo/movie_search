import 'package:movie_search/app/data/models/movie_model.dart';

abstract class RecentMoviesState {}

class RecentMoviesInitial extends RecentMoviesState {}

class RecentMoviesLoading extends RecentMoviesState {}

class RecentMoviesListSucess extends RecentMoviesState {
  final List<MovieModel> filmesRecentes;

  RecentMoviesListSucess(this.filmesRecentes);
}
class RecentMoviesLoadingError extends RecentMoviesState {
  final String mensagem;
  RecentMoviesLoadingError(this.mensagem);
}

