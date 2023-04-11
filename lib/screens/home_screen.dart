import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../widgets/news_card.dart';
import '../provider/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<News>(context,listen: false).fetchAndSet();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "HEADLINES",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10),
            color: Color(0xFF464646),
            child: Consumer<News>(builder: (_, news, __) { 
              return ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      NewsCard(
                          imgUrl: news.articles[idx].imgUrl!,
                          headline: news.articles[idx].headline!,
                          source: news.articles[idx].source!,
                          dateTime: DateFormat('yyyy-MM-dd').format(news.articles[idx].dateTime!)),
                          const SizedBox(height: 20,)
                    ],
                  );
                },
                itemCount: news.articles.length,
              );
            }),
          )),
    );
  }
}
