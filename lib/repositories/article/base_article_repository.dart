import 'package:eskuad/models/models.dart';

abstract class BaseArticleRepository {
  Future<List<Article>> getArticles({required int page});
}
