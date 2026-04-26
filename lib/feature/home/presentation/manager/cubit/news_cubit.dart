import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsdepi/feature/home/data/news_model/news_model.dart';
import 'package:newsdepi/feature/home/data/news_model/repo/news_repo/news_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsRepo) : super(NewsInitial());

  final NewsRepo newsRepo;

  Future<void> fetchNewsData({required String catogry}) async {
    emit(NewsLoading());

    var result = await newsRepo.getAllnew(catogry: catogry);
    result.fold(
      (fauilre) {
        emit(NewsFauilre(message: fauilre.errormessage));
      },
      (newList) {
        emit(NewsSuccess(listItems: newList));
      },
    );
  }
}
