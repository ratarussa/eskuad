import 'package:equatable/equatable.dart';
import 'package:eskuad/data/network/api_model.dart';
import 'package:uuid/uuid.dart';

class Article extends Equatable {
  final String storyId;
  final DateTime createAt;
  final String author;
  final String storyTitle;

  const Article({
    required this.storyId,
    required this.createAt,
    required this.author,
    required this.storyTitle,
  });

  @override
  List<Object?> get props => [storyId, createAt, author, storyTitle];

  factory Article.fromAPI(APIArticle apiArticle) {
    return Article(
      storyId: apiArticle.storyId?.toString() ?? const Uuid().v4(),
      createAt: DateTime.parse(apiArticle.createAt),
      author: apiArticle.author,
      storyTitle: apiArticle.storyTitle ?? '',
    );
  }
}
