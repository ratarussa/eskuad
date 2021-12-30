// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIArticle _$APIArticleFromJson(Map<String, dynamic> json) => APIArticle(
      storyId: json['story_id'] as int?,
      createAt: json['created_at'] as String,
      author: json['author'] as String,
      storyTitle: json['story_title'] as String?,
    );

Map<String, dynamic> _$APIArticleToJson(APIArticle instance) =>
    <String, dynamic>{
      'story_id': instance.storyId,
      'created_at': instance.createAt,
      'author': instance.author,
      'story_title': instance.storyTitle,
    };

APIHits _$APIHitsFromJson(Map<String, dynamic> json) => APIHits(
      articles: (json['hits'] as List<dynamic>)
          .map((e) => APIArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIHitsToJson(APIHits instance) => <String, dynamic>{
      'hits': instance.articles,
    };
