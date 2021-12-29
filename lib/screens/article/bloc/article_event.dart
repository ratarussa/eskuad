part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends ArticleEvent {}

class RefreshArticles extends ArticleEvent {}

class LoadMoreArticles extends ArticleEvent {}
