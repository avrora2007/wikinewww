import 'package:flutter/material.dart';
import '../../../domain/models/summary.dart';

class ArticleWidget extends StatelessWidget {
  final Summary summary;
  const ArticleWidget({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            if (summary.hasImage == true) Image.network(summary.originalImage!.source),
            Text(summary.titles.normalized, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.displaySmall),

            if (summary.description != null)
            Text(summary.description!, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),

            Text(summary.extract)
          ],
        ),
      ),
    );
  }
}