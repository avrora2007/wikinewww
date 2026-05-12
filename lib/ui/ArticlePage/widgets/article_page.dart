import 'package:flutter/material.dart';
import '../widgets/article_widget.dart';
import '../../../domain/models/summary.dart';

class ArticlePage extends StatelessWidget {
  final Summary summary;
  final VoidCallback nextArticle;

  const ArticlePage({super.key, required this.summary, required this.nextArticle});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column(
        children: [
          ArticleWidget(summary: summary),
          ElevatedButton(
            onPressed: nextArticle, 
            child: Text('Next random article')
          )
        ],
      ),
    );
  }
}