import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:newsdepi/core/error_file.dart/faulire.dart';

import 'package:newsdepi/feature/home/presentation/manager/cubit/news_cubit.dart';
import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';

// Mock
class MockNewsRepo extends Mock implements NewsRepo {}

void main() {
  late NewsCubit newsCubit;
  late MockNewsRepo mockRepo;

  setUp(() {
    mockRepo = MockNewsRepo();
    newsCubit = NewsCubit(mockRepo);
  });

  tearDown(() {
    newsCubit.close();
  });

  //  test success
  blocTest<NewsCubit, NewsState>(
    'emit [Loading, Success] when fetchNewsData success',
    build: () {
      when(
        () => mockRepo.getAllnew(catogry: 'sports'),
      ).thenAnswer((_) async => Right(<NewsModel>[]));
      return newsCubit;
    },
    act: (cubit) => cubit.fetchNewsData(catogry: 'sports'),
    expect: () => [isA<NewsLoading>(), isA<NewsSuccess>()],
  );

  //  test failure
  blocTest<NewsCubit, NewsState>(
    'emit [Loading, Failure] when fetchNewsData fails',
    build: () {
      when(
        () => mockRepo.getAllnew(catogry: 'sports'),
      ).thenAnswer((_) async => Left(ServerFailure('error')));
      return newsCubit;
    },
    act: (cubit) => cubit.fetchNewsData(catogry: 'sports'),
    expect: () => [isA<NewsLoading>(), isA<NewsFauilre>()],
  );
}
