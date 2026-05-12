import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../view_models/article_view_model.dart';
import '../../../domain/models/summary.dart';
import '../../../data/repository/RandomArticleRepository.dart';
import '../widgets/article_page.dart';

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

class ArticleViewModel extends ChangeNotifier {
  final RandomArticleRepository model;
  Summary? summary;
  Exception? error;
  bool isLoading = false;

  ArticleViewModel(this.model) {
    fetchArticle();
  }
  
  Future<void> fetchArticle() async {
    isLoading = true;
    notifyListeners();
    try {
      summary = await model.getRandomArticle();
      error = null;
    } on HttpException catch (e) {
      error = e;
      summary = null;
    }
    isLoading = false;
    notifyListeners();
  }
}