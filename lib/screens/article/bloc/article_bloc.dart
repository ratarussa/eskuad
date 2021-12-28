import 'package:equatable/equatable.dart';
import 'package:eskuad/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(ArticleState initialState) : super(initialState);
}
