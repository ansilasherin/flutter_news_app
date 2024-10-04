import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/newsModel.dart/news_view.dart';
import 'package:flutter_news_app/screen/article_page.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsViewModel newsViewModel = context.watch<NewsViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
        ),
        body: Container(
            child: ListView.builder(
          itemCount: newsViewModel.articles.length,
          itemBuilder: (context, index) {
            final allarticles = newsViewModel.articles[index];
            return GestureDetector(
              onTap: () {
                newsViewModel.SetselectedUser(allarticles);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Articlepage()));
              },
              child: Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage(allarticles.urlToImage.toString()),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        allarticles.source!.name.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      allarticles.title.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )));
  }
}
