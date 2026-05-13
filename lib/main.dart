import 'package:flutter/material.dart';
import 'package:wikipedia_reader/ui/ArticlePage/view_models/article_view_model.dart';
import 'package:wikipedia_reader/ui/ArticlePage/widgets/article_page.dart';
import '/../ui/ArticlePage/widgets/article_view.dart';
import '../data/service/RandomArticleService.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: BlocProvider(
        create: (_) => SummaryCubit(),
        child: ArticlePage(summary: summary, nextArticle: nextArticle),
      ),
    );
  }
}