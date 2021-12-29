import 'package:equatable/equatable.dart';
import 'package:eskuad/models/models.dart';
import 'package:eskuad/repositories/repositories.dart';
import 'package:flutter/material.dart';
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
    } else if (event is LoadMoreArticles) {}
  }

  Stream<ArticleState> _mapAppStatedToState() async* {
    yield state.copyWith(status: ArticleStatus.loading);
    yield* _getArticles();
  }

  Stream<ArticleState> _getArticles() async* {
    try {
      final articles = await _articleRepository.getArticles();
      debugPrint(articles.toString());
    } catch (err) {
      yield state.copyWith(
        failure: Failure(message: err.toString()),
        status: ArticleStatus.error,
      );
    }
  }
}
