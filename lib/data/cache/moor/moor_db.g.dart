// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MoorArticleData extends DataClass implements Insertable<MoorArticleData> {
  final String storyId;
  final DateTime createAt;
  final String author;
  final String storyTitle;
  MoorArticleData(
      {required this.storyId,
      required this.createAt,
      required this.author,
      required this.storyTitle});
  factory MoorArticleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MoorArticleData(
      storyId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story_id'])!,
      createAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      storyTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story_title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['story_id'] = Variable<String>(storyId);
    map['create_at'] = Variable<DateTime>(createAt);
    map['author'] = Variable<String>(author);
    map['story_title'] = Variable<String>(storyTitle);
    return map;
  }

  MoorArticleCompanion toCompanion(bool nullToAbsent) {
    return MoorArticleCompanion(
      storyId: Value(storyId),
      createAt: Value(createAt),
      author: Value(author),
      storyTitle: Value(storyTitle),
    );
  }

  factory MoorArticleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorArticleData(
      storyId: serializer.fromJson<String>(json['storyId']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
      author: serializer.fromJson<String>(json['author']),
      storyTitle: serializer.fromJson<String>(json['storyTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'storyId': serializer.toJson<String>(storyId),
      'createAt': serializer.toJson<DateTime>(createAt),
      'author': serializer.toJson<String>(author),
      'storyTitle': serializer.toJson<String>(storyTitle),
    };
  }

  MoorArticleData copyWith(
          {String? storyId,
          DateTime? createAt,
          String? author,
          String? storyTitle}) =>
      MoorArticleData(
        storyId: storyId ?? this.storyId,
        createAt: createAt ?? this.createAt,
        author: author ?? this.author,
        storyTitle: storyTitle ?? this.storyTitle,
      );
  @override
  String toString() {
    return (StringBuffer('MoorArticleData(')
          ..write('storyId: $storyId, ')
          ..write('createAt: $createAt, ')
          ..write('author: $author, ')
          ..write('storyTitle: $storyTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(storyId, createAt, author, storyTitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoorArticleData &&
          other.storyId == this.storyId &&
          other.createAt == this.createAt &&
          other.author == this.author &&
          other.storyTitle == this.storyTitle);
}

class MoorArticleCompanion extends UpdateCompanion<MoorArticleData> {
  final Value<String> storyId;
  final Value<DateTime> createAt;
  final Value<String> author;
  final Value<String> storyTitle;
  const MoorArticleCompanion({
    this.storyId = const Value.absent(),
    this.createAt = const Value.absent(),
    this.author = const Value.absent(),
    this.storyTitle = const Value.absent(),
  });
  MoorArticleCompanion.insert({
    required String storyId,
    required DateTime createAt,
    required String author,
    required String storyTitle,
  })  : storyId = Value(storyId),
        createAt = Value(createAt),
        author = Value(author),
        storyTitle = Value(storyTitle);
  static Insertable<MoorArticleData> custom({
    Expression<String>? storyId,
    Expression<DateTime>? createAt,
    Expression<String>? author,
    Expression<String>? storyTitle,
  }) {
    return RawValuesInsertable({
      if (storyId != null) 'story_id': storyId,
      if (createAt != null) 'create_at': createAt,
      if (author != null) 'author': author,
      if (storyTitle != null) 'story_title': storyTitle,
    });
  }

  MoorArticleCompanion copyWith(
      {Value<String>? storyId,
      Value<DateTime>? createAt,
      Value<String>? author,
      Value<String>? storyTitle}) {
    return MoorArticleCompanion(
      storyId: storyId ?? this.storyId,
      createAt: createAt ?? this.createAt,
      author: author ?? this.author,
      storyTitle: storyTitle ?? this.storyTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (storyId.present) {
      map['story_id'] = Variable<String>(storyId.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (storyTitle.present) {
      map['story_title'] = Variable<String>(storyTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoorArticleCompanion(')
          ..write('storyId: $storyId, ')
          ..write('createAt: $createAt, ')
          ..write('author: $author, ')
          ..write('storyTitle: $storyTitle')
          ..write(')'))
        .toString();
  }
}

class $MoorArticleTable extends MoorArticle
    with TableInfo<$MoorArticleTable, MoorArticleData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MoorArticleTable(this._db, [this._alias]);
  final VerificationMeta _storyIdMeta = const VerificationMeta('storyId');
  late final GeneratedColumn<String?> storyId = GeneratedColumn<String?>(
      'story_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  late final GeneratedColumn<DateTime?> createAt = GeneratedColumn<DateTime?>(
      'create_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _storyTitleMeta = const VerificationMeta('storyTitle');
  late final GeneratedColumn<String?> storyTitle = GeneratedColumn<String?>(
      'story_title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [storyId, createAt, author, storyTitle];
  @override
  String get aliasedName => _alias ?? 'moor_article';
  @override
  String get actualTableName => 'moor_article';
  @override
  VerificationContext validateIntegrity(Insertable<MoorArticleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('story_id')) {
      context.handle(_storyIdMeta,
          storyId.isAcceptableOrUnknown(data['story_id']!, _storyIdMeta));
    } else if (isInserting) {
      context.missing(_storyIdMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    } else if (isInserting) {
      context.missing(_createAtMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('story_title')) {
      context.handle(
          _storyTitleMeta,
          storyTitle.isAcceptableOrUnknown(
              data['story_title']!, _storyTitleMeta));
    } else if (isInserting) {
      context.missing(_storyTitleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MoorArticleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MoorArticleData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoorArticleTable createAlias(String alias) {
    return $MoorArticleTable(_db, alias);
  }
}

abstract class _$ArticleDatabase extends GeneratedDatabase {
  _$ArticleDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoorArticleTable moorArticle = $MoorArticleTable(this);
  late final ArticleDao articleDao = ArticleDao(this as ArticleDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moorArticle];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ArticleDaoMixin on DatabaseAccessor<ArticleDatabase> {
  $MoorArticleTable get moorArticle => attachedDatabase.moorArticle;
}
