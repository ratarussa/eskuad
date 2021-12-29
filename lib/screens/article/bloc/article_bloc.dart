import 'package:equatable/equatable.dart';
import 'package:eskuad/models/models.dart';
import 'package:eskuad/network/api_service.dart';
import 'package:eskuad/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;

  ArticleBloc({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository,
        super(ArticleState.initial());

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStatedToState();
    } else if (event is RefreshArticles) {
      yield* _mapRefreshArticlesToState();
    } else if (event is LoadMoreArticles) {
      yield* _mapLoadMoreArticlesToState();
    }
  }

  Stream<ArticleState> _mapAppStatedToState() async* {
    yield state.copyWith(status: ArticleStatus.loading);
    yield* _getArticles();
  }

  Stream<ArticleState> _mapRefreshArticlesToState() async* {
    yield* _getArticles();
  }

  Stream<ArticleState> _mapLoadMoreArticlesToState() async* {
    final nextPage = state.articles.length ~/ apiPerPage;
    yield* _getArticles(page: nextPage);
  }

  Stream<ArticleState> _getArticles({int page = 0}) async* {
    try {
      final articles = [
        if (page != 0) ...state.articles,
        ...await _articleRepository.getArticles(page: page),
      ];
      yield state.copyWith(articles: articles, status: ArticleStatus.loaded);
    } catch (err) {
      yield state.copyWith(
        failure: Failure(message: err.toString()),
        status: ArticleStatus.error,
      );
    }
  }
}
