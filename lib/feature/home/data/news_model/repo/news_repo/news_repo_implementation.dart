import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsdepi/core/error_file.dart/faulire.dart';
import 'package:newsdepi/core/services/api_servies.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';
import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo.dart';

class NewsRepoImplementation implements NewsRepo {
  final ApiServies apiServies;

  NewsRepoImplementation({required this.apiServies});
  @override
  Future<Either<Failure, List<NewsModel>>> getAllnew({
    required String catogry,
  }) async {
    try {
      var results = await apiServies.get(catogry: catogry);
      List<NewsModel> newsItemList = [];

      for (var item in results['articles']) {
        newsItemList.add(NewsModel.fromjson(item));
      }
      return right(newsItemList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioExpetion(e));
    } catch (e) {
      return left(ServerFailure('there was an error please try later '));
    }
  }
}
