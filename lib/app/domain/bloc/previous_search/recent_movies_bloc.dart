import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_event.dart';
import 'package:movie_search/app/domain/bloc/previous_search/recent_movies_state.dart';
import 'package:movie_search/app/domain/services/local_storage_service.dart';
import 'package:movie_search/app/domain/services/movie_service.dart';

class RecentMoviesBloc extends Bloc<RecentMovieEvent, RecentMoviesState> {
  final logger = Logger();
  final LocalStorageService storage;
  final MovieService movieService;

  RecentMoviesBloc(this.storage, this.movieService)
    : super(RecentMoviesInitial()) {
    on<GetRecentMovies>(_onCarregarRecentes);
  }

  Future<void> _onCarregarRecentes(GetRecentMovies event, Emitter emit) async {
    emit(RecentMoviesLoading());
    try {
      final recentes = await storage.obterFilmesRecentes();
      emit(RecentMoviesListSucess(recentes));
    } catch (e) {
      emit(RecentMoviesLoadingError('Erro ao carregar filmes recentes'));
    }
  }
}
