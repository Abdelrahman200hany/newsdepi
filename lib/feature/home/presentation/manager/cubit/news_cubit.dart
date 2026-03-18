import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:newsdepi/core/services/api_servies.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.apiServies) : super(NewsInitial());
  final ApiServies apiServies;

  Future<void> fetchNewsData({required String catogry}) async {
    emit(NewsLoading());
    
    try {
      var results = await apiServies.get(catogry: catogry);
      List<NewsModel> newsItemList = [];

      for (var item in results['articles']) {
        newsItemList.add(NewsModel.fromjson(item));
      }
      emit(NewsSuccess(listItems: newsItemList));
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;

        if (statusCode == 400) {
          emit(NewsFauilre(message: "Bad request"));
        } else if (statusCode == 401) {
          emit(NewsFauilre(message: "Unauthorized — check API key"));
        } else if (statusCode == 404) {
          emit(NewsFauilre(message: "Not found"));
        } else if (statusCode == 500) {
          emit(NewsFauilre(message: "Server error"));
        } else {
          emit(NewsFauilre(message: "Something went wrong (${statusCode})"));
        }
      } else {
        emit(NewsFauilre(message: "No internet connection"));
      }
    } catch (e) {
      emit(NewsFauilre(message: 'there was an error please there later '));
    }
  }
}
