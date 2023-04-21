import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/news.dart';


class DetailedScreen extends StatelessWidget {
  static const routeName='/detailed-screen';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final articles=Provider.of<News>(context).articles;
    final article=articles.firstWhere((at) => at.id==id);
    return Container(
      child: Text(article.headline!),
    );
  }
}