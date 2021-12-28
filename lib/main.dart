import 'package:equatable/equatable.dart';
import 'package:eskuad/config/custom_router.dart';
import 'package:eskuad/config/strings.dart';
import 'package:eskuad/repositories/repositories.dart';
import 'package:eskuad/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ArticleRepository>(
          create: (_) => ArticleRepository(),
        ),
      ],
      child: MaterialApp(
        title: StringManager.mainTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black87,
          ),
        ),
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: ArticleScreen.routeName,
      ),
    );
  }
}
