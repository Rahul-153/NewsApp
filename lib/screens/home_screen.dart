import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_card_home.dart';
import 'package:news_app/widgets/news_card_view.dart';
import 'package:provider/provider.dart';
import 'package:country_list_pick/country_list_pick.dart';
import '../widgets/search_bar.dart';
import '../provider/news.dart';
import '../provider/list_of_countries.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void didChangeDependencies() {
  //   Provider.of<News>(context).fetchAndSet("");
  //   super.didChangeDependencies();
  // }

  late TabController _tabController;
  dynamic country;
  dynamic cName;
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                SearchBar(),
                ExpansionTile(
                  title: const Text('Country'),
                  children: <Widget>[
                    for (int i = 0; i < listOfCountry.length; i++)
                      ListTile(
                        onTap: () async {
                          country = listOfCountry[i]['code'];
                          cName = listOfCountry[i]['name']!.toUpperCase();
                         await Provider.of<News>(context,listen: false)
                              .changeCountry(country);
                          await Provider.of<News>(context,listen: false)
                              .fetchAndSet("");
                        },
                        title: Text(listOfCountry[i]['name']!.toUpperCase()),
                      ),
                  ],
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text("NEWS"),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.green[300],
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: const [
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Music',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                    Tab(
                      text: 'Health',
                    ),
                    Tab(
                      text: 'Politics',
                    ),
                    Tab(
                      text: 'Science',
                    ),
                  ],
                ),
              ),
              const Expanded(
                  child: TabBarView(
                children: [
                  NewsCardHome(),
                  NewsCardView("Entertainment"),
                  NewsCardView('Sports'),
                  NewsCardView('Music'),
                  NewsCardView('Business'),
                  NewsCardView('Health'),
                  NewsCardView('Politics'),
                  NewsCardView('Science'),
                ],
              ))
            ],
          )),
    );
  }
}
