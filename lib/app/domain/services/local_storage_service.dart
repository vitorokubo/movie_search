import 'dart:convert'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_search/app/data/models/movie_model.dart'; 

class LocalStorageService {
  static const _keyFilmesRecentes = 'filmes_recentes';

  Future<void> salvarFilme(MovieModel filme) async {
    final prefs = await SharedPreferences.getInstance();
    final listaJson = prefs.getStringList(_keyFilmesRecentes) ?? [];

    listaJson.removeWhere(
      (jsonStr) => MovieModel.fromJson(jsonStr).title == filme.title,
    );

    listaJson.insert(0, json.encode(filme.toMap()));

    final recentes = listaJson.take(5).toList();
    await prefs.setStringList(_keyFilmesRecentes, recentes);
  }

  Future<List<MovieModel>> obterFilmesRecentes() async {
    final prefs = await SharedPreferences.getInstance();
    final listaJson = prefs.getStringList(_keyFilmesRecentes) ?? [];

    return listaJson.map((jsonStr) => MovieModel.fromJson(jsonStr)).toList();
  }
}
