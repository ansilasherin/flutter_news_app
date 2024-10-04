import 'package:flutter/material.dart';
import 'package:flutter_news_app/newsModel.dart/news_view.dart';
import 'package:provider/provider.dart';

class Articlepage extends StatelessWidget {
  Articlepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NewsViewModel newsViewModel = context.watch<NewsViewModel>();

    final details = newsViewModel.selectarticle;
    return Scaffold(
      appBar: AppBar(
        title: Text(details!.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              details.title.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(details.publishedAt.toString()),
            SizedBox(height: 10),
            details.urlToImage != null
                ? Image.network(details.urlToImage!)
                : SizedBox.shrink(),
            SizedBox(height: 10),
            Text(
              details.content.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
