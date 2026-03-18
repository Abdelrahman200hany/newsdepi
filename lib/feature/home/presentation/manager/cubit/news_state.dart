part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsFauilre extends NewsState {
  final String message;

  NewsFauilre({required this.message});
}

final class NewsSuccess extends NewsState {
  final List<NewsModel> listItems;

  NewsSuccess({required this.listItems});
}
