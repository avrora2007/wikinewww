import 'package:flutter/material.dart';
import 'package:wikipedia_reader/data/repository/RandomArticleRepository.dart';
import '../view_models/article_view_model.dart';
import 'article_page.dart';
import '../../../domain/models/summary.dart';

class ArticleView extends StatefulWidget {
  ArticleView({super.key});

  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final viewModel = ArticleViewModel(RandomArticleRepository());

  @override
  void initState() {
    super.initState();
    viewModel.fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wikipedia")),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return switch ((viewModel.isLoading, viewModel.summary, viewModel.error)) {
              (true, _, _) => CircularProgressIndicator(),
              (_, _, Exception e) => Text('Error: $e'),
              (_, Summary summary?, _) => ArticlePage(summary: summary, nextArticle: viewModel.fetchArticle),
              _ => Text("Something went wrong"),
            };
          }
        ),
      ),
    );
  }
}