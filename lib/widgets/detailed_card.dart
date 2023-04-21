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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(img),
            Text(title,style: const TextStyle(
                              fontSize: 20,
                              color: Color(0XFFf2f2f2),
                              fontFamily: 'Roboto Slab')),
            Text(source),
            Text(description)
          ],
        ),
      ),
    );
  }
}
