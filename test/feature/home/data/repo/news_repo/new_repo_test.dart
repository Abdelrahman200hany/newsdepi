import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:newsdepi/core/services/api_servies.dart';

import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo.dart';
import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo_implementation.dart';

//  mock apiServies
class MockApiServies extends Mock implements ApiServies {}

void main() {
  late MockApiServies mockApi;
  late NewsRepo repo;

  setUp(() {
    mockApi = MockApiServies();
    repo = NewsRepoImplementation(apiServies: mockApi);
  });

  //  Success Test
  test('should return list of NewsModel when API call is successful', () async {
    // arrange
    when(() => mockApi.get(catogry: 'sports')).thenAnswer(
      (_) async => {
        'articles': [
          {'title': 'Test News', 'description': 'Test Desc'},
        ],
      },
    );

    // act
    final result = await repo.getAllnew(catogry: 'sports');

    // assert
    expect(result.isRight(), true);
    result.fold((l) => fail('should not fail'), (list) {
      expect(list.length, 1);
      expect(list.first.title, 'Test News');
    });
  });

  //  Failure Test (DioException)
  test('should return Failure when DioException occurs', () async {
    // arrange
    when(
      () => mockApi.get(catogry: 'sports'),
    ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

    // act
    final result = await repo.getAllnew(catogry: 'sports');

    // assert
    expect(result.isLeft(), true);
  });
}
