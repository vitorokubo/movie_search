import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class MovieRepository {
  Future<List<Map<String, dynamic>>> fetchMovies(String titulo);
  Future<Map<String, dynamic>> fetchMovieDetail(String imdbID);
}

class MovieRepositoryImpl implements MovieRepository {
  Dio _dio = Dio(); // Remova o final para permitir a injeção
  final apiKey = dotenv.env['API_KEY'];
  MovieRepositoryImpl({Dio? dio}) {
    if (dio != null) {
      _dio = dio;
    }
  }
  @override
  Future<List<Map<String, dynamic>>> fetchMovies(String titulo) async {
    final url = 'https://www.omdbapi.com/?s=$titulo&apikey=$apiKey';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final json = response.data;

        if (json['Response'] == 'True') {
          final List resultados = json['Search'];
          return resultados
              .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
              .toList();
        } else {
          throw Exception(json['Error']);
        }
      } else {
        throw Exception('Erro de conexão com a API');
      }
    } catch (e) {
      throw Exception('Erro ao buscar filmes: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> fetchMovieDetail(String imdbID) async {
    final url = 'https://www.omdbapi.com/?i=$imdbID&apikey=$apiKey&plot=full';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final json = response.data;

        if (json['Response'] == 'True') {
          return json;
        } else {
          throw Exception(json['Error']);
        }
      } else {
        throw Exception('Erro de conexão com a API');
      }
    } catch (e) {
      throw Exception('Erro ao buscar detalhes do filme: $e');
    }
  }
}
