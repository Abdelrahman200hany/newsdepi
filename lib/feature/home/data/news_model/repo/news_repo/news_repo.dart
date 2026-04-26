import 'package:dartz/dartz.dart';
import 'package:newsdepi/core/error_file.dart/faulire.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<NewsModel>>> getAllnew({required String catogry});
}
