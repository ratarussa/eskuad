part of 'article_bloc.dart';

enum ArticleStatus { initial, loading, loaded, error }

class ArticleState extends Equatable {
  final List<Article> articles;
  final ArticleStatus status;
  final Failure failure;

  const ArticleState({
    required this.articles,
    required this.status,
    required this.failure,
  });

  factory ArticleState.initial() => const ArticleState(
        articles: [],
        status: ArticleStatus.initial,
        failure: Failure(),
      );

  @override
  List<Object?> get props => [articles, status, failure];

  ArticleState copyWith({
    List<Article>? articles,
    ArticleStatus? status,
    Failure? failure,
  }) {
    return ArticleState(
      articles: articles ?? this.articles,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
