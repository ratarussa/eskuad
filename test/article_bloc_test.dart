import 'package:bloc_test/bloc_test.dart';
import 'package:drift/native.dart';
import 'package:equatable/equatable.dart';
import 'package:eskuad/data/cache/moor/moor_db.dart';
import 'package:eskuad/models/models.dart';
import 'package:eskuad/screens/article/bloc/article_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'repositories/mock_article_repository.dart';

void main() {
  group('ArticleBloc Test', () {
    late ArticleBloc articleBloc;
    late ArticleDatabase articleDatabase;
    MockArticleRepository mockArticleRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      articleDatabase = ArticleDatabase(NativeDatabase.memory());
      mockArticleRepository = MockArticleRepository(
        articleDatabase,
        articleDatabase.articleDao,
      );
      articleBloc = ArticleBloc(articleRepository: mockArticleRepository);
    });

    tearDown(() async {
      await articleDatabase.close();
      articleBloc.close();
    });

    blocTest<ArticleBloc, ArticleState>(
      'First test...',
      build: () => articleBloc,
      act: (bloc) => bloc.add(AppStarted()),
      expect: () => [
        const ArticleState(
          articles: [],
          status: ArticleStatus.loading,
          failure: Failure(),
        ),
        ArticleState(
          articles: [
            Article(
              storyId: 'Id A',
              createAt: DateTime(2022, 1, 06),
              author: 'Author A',
              storyTitle: 'Story A',
            ),
            Article(
              storyId: 'Id B',
              createAt: DateTime(2022, 1, 06),
              author: 'Author B',
              storyTitle: 'Story B',
            ),
            Article(
              storyId: 'Id C',
              createAt: DateTime(2022, 1, 06),
              author: 'Author C',
              storyTitle: 'Story C',
            ),
          ],
          status: ArticleStatus.loaded,
          failure: const Failure(),
        ),
      ],
    );
  });
}
