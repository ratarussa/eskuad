import 'package:eskuad/config/strings.dart';
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
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            switch (state.status) {
              case ArticleStatus.error:
                return const Center();
              case ArticleStatus.loaded:
                return const Center();
              default:
                return const Center();
            }
          },
        ),
      ),
    );
  }
}
