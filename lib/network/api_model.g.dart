// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIArticle _$APIArticleFromJson(Map<String, dynamic> json) => APIArticle(
      createAt: json['created_at'] as String,
      author: json['author'] as String,
      storyTitle: json['story_title'] as String,
    );

Map<String, dynamic> _$APIArticleToJson(APIArticle instance) =>
    <String, dynamic>{
      'created_at': instance.createAt,
      'author': instance.author,
      'story_title': instance.storyTitle,
    };

APIHits _$APIHitsFromJson(Map<String, dynamic> json) => APIHits(
      articles: (json['article'] as List<dynamic>)
          .map((e) => APIArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIHitsToJson(APIHits instance) => <String, dynamic>{
      'article': instance.articles,
    };
