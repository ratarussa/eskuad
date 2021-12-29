import 'package:eskuad/config/strings.dart';
import 'package:eskuad/extensions/datetime_extension.dart';
import 'package:eskuad/models/article/article_model.dart';
import 'package:eskuad/repositories/repositories.dart';
import 'package:eskuad/screens/article/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleScreen extends StatefulWidget {
  static const String routeName = '/article';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<ArticleBloc>(
        create: (_) => ArticleBloc(
          articleRepository: context.read<ArticleRepository>(),
        )..add(AppStarted()),
        child: const ArticleScreen(),
      ),
    );
  }

  const ArticleScreen({Key? key}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: const Text(StringManager.articleTitle)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              switch (state.status) {
                case ArticleStatus.error:
                  return _buildError(state);
                case ArticleStatus.loaded:
                  return _buildArticles(state);
                default:
                  return _buildLoading();
              }
            },
          ),
        ),
      ),
    );
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController!.position.extentAfter == 0) {
      context.read<ArticleBloc>().add(LoadMoreArticles());
    }
    return false;
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(ArticleState state) {
    return Center(
      child: Text(
        state.failure.message,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildArticles(ArticleState state) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ArticleBloc>().add(RefreshArticles());
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) => _onScrollNotification(notification),
        child: _buildArticlesList(state.articles),
      ),
    );
  }

  Widget _buildArticlesList(List<Article> articles) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          key: Key(article.storyId),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 22.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.createAt.toCustomString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  article.storyTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${StringManager.articleAuthorPrefix} ${article.author}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
