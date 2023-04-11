import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './provider/news.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<News>(
      create: (context) => News(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'RobotoSlab',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'RobotoSlab',
            letterSpacing: 15
          )
        ),
      ),
      home: HomeScreen(),
    ));
  }
}

