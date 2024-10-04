

import 'package:flutter/material.dart';
import 'package:flutter_news_app/newsModel.dart/news_view.dart';
import 'package:flutter_news_app/screen/homepage.dart';
import 'package:flutter_news_app/screen/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsViewModel()..fetchNews(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splashscreen(),
      ),
    );
  }
}



