import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String imgUrl;
  final String headline;
  final String source;
  final String dateTime;
  NewsCard(
      {required this.imgUrl,
      required this.headline,
      required this.source,
      required this.dateTime});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width*0.9,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
                  child: Column(
                    children: [
                      Text(
                        headline,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0XFFf2f2f2),
                            fontFamily: 'Roboto Slab'),
                        softWrap: true,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Text(
                            source,
                            style: const TextStyle(color: Color(0xFFbababa)),
                          ),
                          const SizedBox(width: 10,),
                          Text(dateTime,
                              style: const TextStyle(color: Color(0xFFbababa))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
