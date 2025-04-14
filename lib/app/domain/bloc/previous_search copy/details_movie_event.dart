import 'package:movie_search/app/data/models/movie_model.dart';

abstract class DetailsMovieEvent {}

class SearchDetailsMovie extends DetailsMovieEvent {
  final MovieModel filme;

  SearchDetailsMovie(this.filme);
}
