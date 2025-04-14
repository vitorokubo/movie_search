import 'package:logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/local_storage_service.dart';
import '../../services/movie_service.dart';
import 'details_movie_event.dart';
import 'details_movie_state.dart';

class DetailsMoviesBloc extends Bloc<DetailsMovieEvent, DetailsMovieState> {
  final logger = Logger();
  final LocalStorageService storage;
  final MovieService movieService;

  DetailsMoviesBloc(this.storage, this.movieService)
    : super(MovieDetailsInitial()) {
    on<SearchDetailsMovie>(_onBuscarDetalheFilme);
  }

  Future<void> _onBuscarDetalheFilme(
    SearchDetailsMovie event,
    Emitter emit,
  ) async {
    emit(MovieDetailsLoading());
    try {
      await storage.salvarFilme(event.filme);
      emit(MovieDetailsSucess());
    } catch (e, stackTrace) {
      logger.e(
        'Erro ao buscar detalhes do filme',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
