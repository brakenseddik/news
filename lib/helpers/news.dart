import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/article.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&apiKey=8cffa3cfa220477c888550b1386d0386';
    var request = await http.get(url);
    var jsonData = jsonDecode(request.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['url'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            image: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategorieNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=8cffa3cfa220477c888550b1386d0386';
    var request = await http.get(url);
    var jsonData = jsonDecode(request.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['url'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            image: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
