import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../widgets/news_card.dart';
import '../provider/news.dart';
import '../screens/detailed_screen.dart';

class EntScreen extends StatelessWidget {
  const EntScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(top: 10),
            color: Color(0xFF464646),
            child: Consumer<News>(builder: (_, news, __) {
              return ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DetailedScreen.routeName,
                              arguments: news.articles[idx].id);
                        },
                        child: NewsCard(
                            imgUrl: news.articles[idx].imgUrl!,
                            headline: news.articles[idx].headline!,
                            source: news.articles[idx].source!,
                            dateTime: DateFormat('yyyy-MM-dd')
                                .format(news.articles[idx].dateTime!)),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
                itemCount: news.articles.length,
              );
            }),
          );
  }
}