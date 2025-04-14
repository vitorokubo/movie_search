abstract class DetailsMovieState {}

class MovieDetailsInitial extends DetailsMovieState {}

class MovieDetailsLoading extends DetailsMovieState {}

class MovieDetailsSucess extends DetailsMovieState {}

class MovieDetailsError extends DetailsMovieState {
  final String mensagem;
  MovieDetailsError(this.mensagem);
}
