abstract class MovieSearchEvent {}

class BuscarFilme extends MovieSearchEvent {
  final String query;
  BuscarFilme(this.query);
}
