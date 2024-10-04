import 'package:flutter/material.dart';
import 'package:flutter_news_app/newsModel.dart/news_Model.dart';
import 'package:flutter_news_app/service/webservice.dart';

class NewsViewModel extends ChangeNotifier {
  List<Articles> _articles = [];
  List<Articles> get articles => _articles;

  Articles? _selectedarticle;

  bool _loading = false;
  bool get loading => _loading;

  Articles? get selectarticle => _selectedarticle;

  SetselectedUser(Articles articles) {
    _selectedarticle = articles;
  }

  Future<void> fetchNews() async {
    _loading = true;
    notifyListeners();
    NewsModel newsData = await NewsRepository().getNews();
    _articles = newsData.articles ?? [];
    _loading = false;
    notifyListeners();
  }
}
