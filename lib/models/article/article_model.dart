import 'package:equatable/equatable.dart';
import 'package:eskuad/network/api_model.dart';

class Article extends Equatable {
  final int? storyId;
  final String createAt;
  final String author;
  final String? storyTitle;

  const Article({
    required this.storyId,
    required this.createAt,
    required this.author,
    required this.storyTitle,
  });

  @override
  List<Object?> get props => [createAt, author, storyTitle];

  factory Article.fromAPI(APIArticle apiArticle) {
    return Article(
      storyId: apiArticle.storyId,
      createAt: apiArticle.createAt,
      author: apiArticle.author,
      storyTitle: apiArticle.storyTitle,
    );
  }
}
