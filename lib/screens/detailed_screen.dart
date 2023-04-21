import 'package:flutter/material.dart';
import 'package:news_app/widgets/detailed_card.dart';
import 'package:provider/provider.dart';
import '../provider/news.dart';


class DetailedScreen extends StatelessWidget {
  static const routeName='/detailed-screen';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final articles=Provider.of<News>(context).articles;
    final article=articles.firstWhere((at) => at.id==id);
    return DetailedCard(title: article.headline!, description: article.description!, img: article.imgUrl!, source: article.source!);
  }
}