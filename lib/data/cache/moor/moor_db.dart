import 'package:eskuad/models/models.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_db.g.dart';

class MoorArticle extends Table {
  TextColumn get storyId => text()();

  DateTimeColumn get createAt => dateTime()();

  TextColumn get author => text()();

  TextColumn get storyTitle => text()();
}

@UseMoor(tables: [MoorArticle], daos: [ArticleDao])
class ArticleDatabase extends _$ArticleDatabase {
  ArticleDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'articles.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [MoorArticle])
class ArticleDao extends DatabaseAccessor<ArticleDatabase>
    with _$ArticleDaoMixin {
  final ArticleDatabase db;

  ArticleDao(this.db) : super(db);

  Future<List<MoorArticleData>> findAllArticles() => select(moorArticle).get();

  Future insertArticle(Insertable<MoorArticleData> article) =>
      into(moorArticle).insert(article);

  Future deleteAllArticles() => Future.value(delete(moorArticle).go());
}

Insertable<MoorArticleData> articleToInsertableMoorArticle(Article article) {
  return MoorArticleCompanion.insert(
    storyId: article.storyId,
    createAt: article.createAt,
    author: article.author,
    storyTitle: article.storyTitle,
  );
}

Article moorArticleToArticle(MoorArticleData article) {
  return Article(
    storyId: article.storyId,
    createAt: article.createAt,
    author: article.author,
    storyTitle: article.storyTitle,
  );
}
