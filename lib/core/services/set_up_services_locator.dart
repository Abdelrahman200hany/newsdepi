import 'package:get_it/get_it.dart';
import 'package:newsdepi/core/services/api_servies.dart';
import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo.dart';
import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo_implementation.dart';

final getIt = GetIt.instance;

void setUp(){


  getIt.registerSingleton<ApiServies>(ApiServies());

  getIt.registerSingleton<NewsRepo>(NewsRepoImplementation(apiServies: getIt.get<ApiServies>()));
}