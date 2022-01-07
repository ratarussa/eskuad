import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:eskuad/models/models.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'moor_db.g.dart';

class MoorArticle extends Table {
  TextColumn get storyId => text()();

  DateTimeColumn get createAt => dateTime()();

  TextColumn get author => text()();

  TextColumn get storyTitle => text()();
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'articles.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [MoorArticle], daos: [ArticleDao])
class ArticleDatabase extends _$ArticleDatabase {
  ArticleDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [MoorArticle])
class ArticleDao extends DatabaseAccessor<ArticleDatabase>
    with _$ArticleDaoMixin {
  final ArticleDatabase db;

  ArticleDao(this.db) : super(db);

  Future<List<MoorArticleData>> findAllArticles() => (select(moorArticle)
        ..orderBy([
          (article) => OrderingTerm.desc(article.createAt),
        ]))
      .get();

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
    createAt: article.createAt.toUtc(),
    author: article.author,
    storyTitle: article.storyTitle,
  );
}
