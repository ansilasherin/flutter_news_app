import 'package:flutter/material.dart';
import 'package:flutter_news_app/newsModel.dart/news_Model.dart';

class NewsDetailView extends StatelessWidget {
  final Articles article;

  NewsDetailView({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'News Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title ?? 'No Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(article.publishedAt ?? ''),
            SizedBox(height: 10),
            article.urlToImage != null
                ? Image.network(article.urlToImage!)
                : SizedBox.shrink(),
            SizedBox(height: 10),
            Text(
              article.content ?? 'No Content',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
