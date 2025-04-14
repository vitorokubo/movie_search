import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/movie_service.dart';
import 'movie_search_event.dart';
import 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final MovieService movieService;

  MovieSearchBloc(this.movieService) : super(MovieInitial()) {
    on<BuscarFilme>(_onBuscarFilme);
  }

  Future<void> _onBuscarFilme(BuscarFilme event, Emitter emit) async {
    emit(MovieLoading());
    try {
      final filmes = await movieService.buscarFilmes(event.query);
      emit(MovieSearchSuccess(filmes));
    } catch (e) {
      emit(MovieSearchError(e.toString()));
    }
  }
}
