import 'package:eskuad/data/cache/moor/moor_db.dart';
import 'package:eskuad/data/network/api_service.dart';
import 'package:eskuad/models/models.dart';
import 'package:eskuad/repositories/repositories.dart';

class ArticleRepository extends BaseArticleRepository {
  final ApiService _apiService;
  final ArticleDatabase _articleDatabase;
  late final ArticleDao _articleDao;

  ArticleRepository({
    ApiService? apiService,
    ArticleDatabase? articleDatabase,
    ArticleDao? articleDao,
  })  : _apiService = apiService ?? ApiService.create(),
        _articleDatabase = articleDatabase ?? ArticleDatabase() {
    _articleDao = articleDao ?? _articleDatabase.articleDao;
  }

  @override
  Future<List<Article>> getArticles({required int page}) async {
    final response = await _apiService.queryHits(page);
    final articles = response.body!.articles;
    articles.sort((a, b) => b.createAt.compareTo(a.createAt));
    return articles.map((article) => Article.fromAPI(article)).toList();
  }

  @override
  Future insertCachedArticles({required List<Article> articles}) async {
    await _articleDao.deleteAllArticles();
    for (final article in articles) {
      await _articleDao.insertArticle(articleToInsertableMoorArticle(article));
    }
  }

  @override
  Future<List<Article>> findAllCachedArticles() async {
    return await _articleDao.findAllArticles().then(
      (listOfArticles) {
        final articles = <Article>[];
        for (final item in listOfArticles) {
          articles.add(moorArticleToArticle(item));
        }
        return articles;
      },
    );
  }

  @override
  void close() {
    _apiService.client.dispose();
    _articleDatabase.close();
  }
}
