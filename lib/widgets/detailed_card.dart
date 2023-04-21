import 'package:flutter/material.dart';

class DetailedCard extends StatelessWidget {
  String title;
  String description;
  String source;
  String img;

  DetailedCard(
      {required this.title,
      required this.description,
      required this.img,
      required this.source});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(title),
          Text(source),
          Image.network(img),
          Text(description)
        ],
      ),
    );
  }
}
