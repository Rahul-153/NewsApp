import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/news_card.dart';

class News extends ChangeNotifier {
  List<NewsCard> _articles = [
    NewsCard(
        dateTime: DateTime.now(),
        description:
            "BEIJING — Elon Musk, CEO of Tesla, announced on Twitter on Sunday that his company would build a factory in Shanghai with the aim to assemble 10,000 giant batteries annually for electric producers and distributors. The batteries, which Tesla calls Megapacks, …",
        headline: "Elon Musk says Tesla will build Shanghai battery factory",
        imgUrl: "https://c.biztoc.com/171/og.png",
        source: "Biztoc.com"),
    NewsCard(
        dateTime: DateTime.now(),
        description:
            "BEIJING — Elon Musk, CEO of Tesla, announced on Twitter on Sunday that his company would build a factory in Shanghai with the aim to assemble 10,000 giant batteries annually for electric producers and distributors. The batteries, which Tesla calls Megapacks, …",
        headline: "Elon Musk says Tesla will build Shanghai battery factory",
        imgUrl: "https://c.biztoc.com/171/og.png",
        source: "Biztoc.com"),
    NewsCard(
        dateTime: DateTime.now(),
        description:
            "BEIJING — Elon Musk, CEO of Tesla, announced on Twitter on Sunday that his company would build a factory in Shanghai with the aim to assemble 10,000 giant batteries annually for electric producers and distributors. The batteries, which Tesla calls Megapacks, …",
        headline: "Elon Musk says Tesla will build Shanghai battery factory",
        imgUrl: "https://c.biztoc.com/171/og.png",
        source: "Biztoc.com"),
    NewsCard(
        dateTime: DateTime.now(),
        description:
            "BEIJING — Elon Musk, CEO of Tesla, announced on Twitter on Sunday that his company would build a factory in Shanghai with the aim to assemble 10,000 giant batteries annually for electric producers and distributors. The batteries, which Tesla calls Megapacks, …",
        headline: "Elon Musk says Tesla will build Shanghai battery factory",
        imgUrl: "https://c.biztoc.com/171/og.png",
        source: "Biztoc.com"),
    NewsCard(
        dateTime: DateTime.now(),
        description:
            "BEIJING — Elon Musk, CEO of Tesla, announced on Twitter on Sunday that his company would build a factory in Shanghai with the aim to assemble 10,000 giant batteries annually for electric producers and distributors. The batteries, which Tesla calls Megapacks, …",
        headline: "Elon Musk says Tesla will build Shanghai battery factory",
        imgUrl: "https://c.biztoc.com/171/og.png",
        source: "Biztoc.com")
  ];

  List<NewsCard> get articles {
    return _articles;
  }

  final url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=4cdf110ac29a47deabe1b6ff17c3179e";
  Future<void> fetchAndSet() async {
    try {
      final response = await http.get(Uri.parse(url));
      // print(json.decode(response.body));
      final fetchedData = json.decode(response.body)['articles'];
      print(fetchedData);
      List<NewsCard> temp = [];
      fetchedData.forEach((value) {
        temp.add(NewsCard(
            dateTime: DateTime.parse(value['publishedAt']),
            description: value['description'],
            headline: value['title'],
            imgUrl: value['urlToImage'],
            source: value['source']['name']));
      });
      _articles = temp;
      print(_articles);
      notifyListeners();
    } catch (e) {
      print(e.toString());
      // throw e;
    }
  }
}
