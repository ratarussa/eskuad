import 'package:eskuad/models/models.dart';
import 'package:eskuad/network/api_service.dart';
import 'package:eskuad/repositories/repositories.dart';

class ArticleRepository extends BaseArticleRepository {
  final ApiService _apiService;

  ArticleRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService.create();

  @override
  Future<List<Article>> getArticles({required int page}) async {
    final response = await _apiService.queryHits(page);
    if (!response.isSuccessful || response.body == null) throw Exception();
    final articles = response.body!.articles;
    articles.sort((a, b) => b.createAt.compareTo(a.createAt));
    return articles
        .where((article) => article.storyTitle != null)
        .map((article) => Article.fromAPI(article))
        .toList();
  }
}
