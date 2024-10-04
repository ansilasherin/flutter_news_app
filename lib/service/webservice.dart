import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_news_app/newsModel.dart/news_Model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<NewsModel> getNews() async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3e20e7d8b106428b99188e9b22344b7a'));

    if (response.statusCode == 200) {
      return NewsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}
