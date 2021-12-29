import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_model.g.dart';

@JsonSerializable()
class APIArticle extends Equatable {
  @JsonKey(name: 'created_at')
  final String createAt;
  @JsonKey(name: 'author')
  final String author;
  @JsonKey(name: 'story_title')
  final String storyTitle;

  const APIArticle({
    required this.createAt,
    required this.author,
    required this.storyTitle,
  });

  @override
  List<Object?> get props => [createAt, author, storyTitle];

  static const fromJsonFactory = _$APIArticleFromJson;

  factory APIArticle.fromJson(Map<String, dynamic> json) =>
      _$APIArticleFromJson(json);

  Map<String, dynamic> toJson() => _$APIArticleToJson(this);
}

@JsonSerializable()
class APIHits extends Equatable {
  @JsonKey(name: 'hits')
  final List<APIArticle> articles;

  const APIHits({required this.articles});

  @override
  List<Object?> get props => [articles];

  static const fromJsonFactory = _$APIHitsFromJson;

  factory APIHits.fromJson(Map<String, dynamic> json) =>
      _$APIHitsFromJson(json);

  Map<String, dynamic> toJson() => _$APIHitsToJson(this);
}
