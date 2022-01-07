import 'package:eskuad/data/cache/moor/moor_db.dart';
import 'package:eskuad/models/models.dart';
import 'package:eskuad/repositories/repositories.dart';

List<Article> mockArticles = [
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
];

class MockArticleRepository extends BaseArticleRepository {
  final ArticleDatabase _articleDatabase;

  MockArticleRepository(
    ArticleDatabase articleDatabase,
    ArticleDao articleDao,
  ) : _articleDatabase = articleDatabase;

  @override
  void close() {
    // Ignore
  }

  @override
  Future<List<Article>> findAllCachedArticles() async =>
      Future.delayed(const Duration(seconds: 2), () => [...mockArticles]);

  @override
  Future<List<Article>> getArticles({required int page}) async =>
      Future.delayed(const Duration(seconds: 2), () => [...mockArticles]);

  @override
  Future insertCachedArticles({required List<Article> articles}) async {
    mockArticles.addAll(articles);
  }
}
