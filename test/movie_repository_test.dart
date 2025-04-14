import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_search/app/data/repositories/movie_repository.dart';
import 'movie_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() async {
  late MovieRepositoryImpl repository;
  late MockDio mockDio;
  await dotenv.load();

  setUp(() {
    mockDio = MockDio();
    repository = MovieRepositoryImpl(
      dio: mockDio,
    ); // Passando o mockDio para o construtor
  });

  group('fetchMovies', () {
    test(
      'deve retornar uma lista de filmes quando a chamada for bem-sucedida',
      () async {
        // Arrange
        final mockResponse = {
          'Response': 'True',
          'Search': [
            {'Title': 'Movie 1', 'imdbID': '1', 'Year': '2020'},
            {'Title': 'Movie 2', 'imdbID': '2', 'Year': '2021'},
          ],
        };

        when(mockDio.get(any)).thenAnswer(
          (_) async => Response(
            data: mockResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // Act
        final result = await repository.fetchMovies('avengers');

        // Assert
        expect(result, isA<List<Map<String, dynamic>>>());
        expect(result.length, 2);
        expect(result[0]['Title'], 'Movie 1');
        expect(result[1]['Title'], 'Movie 2');
        verify(mockDio.get(any)).called(1);
      },
    );

    test('deve lançar uma exceção quando a API retornar um erro', () async {
      // Arrange
      final mockResponse = {'Response': 'False', 'Error': 'Movie not found!'};

      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // Act & Assert
      expect(
        () => repository.fetchMovies('filmeinexistente'),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Movie not found!'),
          ),
        ),
      );
    });

    group('fetchMovieDetail', () {
      test(
        'deve retornar os detalhes do filme quando a chamada for bem-sucedida',
        () async {
          // Arrange
          final mockResponse = {
            'Response': 'True',
            'Title': 'Inception',
            'Year': '2010',
            'Plot': 'A thief who steals corporate secrets...',
          };

          when(mockDio.get(any)).thenAnswer(
            (_) async => Response(
              data: mockResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // Act
          final result = await repository.fetchMovieDetail('tt1375666');

          // Assert
          expect(result, isA<Map<String, dynamic>>());
          expect(result['Title'], 'Inception');
          expect(result['Year'], '2010');
          expect(result['Plot'], 'A thief who steals corporate secrets...');
          verify(mockDio.get(any)).called(1);
        },
      );

      test(
        'deve lançar uma exceção quando o filme não for encontrado',
        () async {
          // Arrange
          final mockResponse = {
            'Response': 'False',
            'Error': 'Movie not found!',
          };

          when(mockDio.get(any)).thenAnswer(
            (_) async => Response(
              data: mockResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
            ),
          );

          // Act & Assert
          expect(
            () => repository.fetchMovieDetail('id_inexistente'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Movie not found!'),
              ),
            ),
          );
        },
      );
    });
  });
}
