import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../widgets/news_card.dart';
import '../provider/news.dart';
import '../screens/detailed_screen.dart';

class NewsCardHome extends StatefulWidget {
  const NewsCardHome({super.key});

  @override
  State<NewsCardHome> createState() => _NewsCardHomeState();
}

class _NewsCardHomeState extends State<NewsCardHome> {
  bool _loading = true;
  @override
  void didChangeDependencies() {
    _onLoading();
    super.didChangeDependencies();
  }

  void _onLoading() async {
    try {
      await Provider.of<News>(context,listen: false).fetchAndSet("");
      setState(() {
        _loading = false;
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      color: Color(0xFF464646),
      child: Consumer<News>(builder: (_, news, __) {
        return _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DetailedScreen.routeName,
                              arguments: news.articles[idx].id);
                        },
                        child: NewsCard(
                            imgUrl: news.articlesHome[idx].imgUrl!,
                            headline: news.articlesHome[idx].headline!,
                            source: news.articlesHome[idx].source!,
                            dateTime: DateFormat('yyyy-MM-dd')
                                .format(news.articlesHome[idx].dateTime!)),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
                itemCount: news.articlesHome.length,
              );
      }),
    );
  }
}