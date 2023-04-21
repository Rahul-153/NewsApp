import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/news_card.dart';

class News extends ChangeNotifier {
  dynamic country="in";
  dynamic query="";
  List<NewsCard> _articles = [];
  List<NewsCard> _articlesHome = [];
  List<NewsCard> get articles {
    return _articles;
  }
  List<NewsCard> get articlesHome {
    return _articlesHome;
  }
  changeCountry(String count){
    country=count;
    notifyListeners();
  }
  changeQuery(String q){
    query=q;
    notifyListeners();
  }
  Future<void> fetchAndSetQuery(String query)async {
try {
      final url =
      "https://newsapi.org/v2/top-headlines?q=$query&apiKey=4cdf110ac29a47deabe1b6ff17c3179e";
      final response = await http.get(Uri.parse(url));
      // print(json.decode(response.body));
      final fetchedData = json.decode(response.body)['articles'];
      print(fetchedData);
      List<NewsCard> temp = [];
      fetchedData.forEach((value) {
        temp.add(NewsCard(
            id: const Uuid().v4(),
            dateTime: DateTime.parse(value['publishedAt']),
            description: value['description'] ?? "Not Found",
            headline: value['title'] ?? "Not Found",
            imgUrl: value['urlToImage'] ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnhGUsfZyVtNDkMdFtYW1g6HocQ8mP9DV1lusaFshZ&s.jpeg",
            source: value['source']['name'] ?? "Not Found"));
      });
      // print(articles.first.id);
      _articlesHome=temp;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      // throw e;
    }
  }
  Future<void> fetchAndSet(String cat) async {
    try {
      final url =
      "https://newsapi.org/v2/top-headlines?country=$country&category=$cat&apiKey=4cdf110ac29a47deabe1b6ff17c3179e";
      final response = await http.get(Uri.parse(url));
      // print(json.decode(response.body));
      final fetchedData = json.decode(response.body)['articles'];
      print(fetchedData);
      List<NewsCard> temp = [];
      fetchedData.forEach((value) {
        temp.add(NewsCard(
            id: const Uuid().v4(),
            dateTime: DateTime.parse(value['publishedAt']),
            description: value['description'] ?? "Not Found",
            headline: value['title'] ?? "Not Found",
            imgUrl: value['urlToImage'] ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnhGUsfZyVtNDkMdFtYW1g6HocQ8mP9DV1lusaFshZ&s.jpeg",
            source: value['source']['name'] ?? "Not Found"));
      });
      // print(articles.first.id);
      _articlesHome=temp;
      _articles = temp;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      // throw e;
    }
  }
}
