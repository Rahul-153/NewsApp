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
    return  SafeArea(
      child: Material(
         type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              color: Color(0xFF464646),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(img,height: MediaQuery.of(context).size.height*0.5,fit: BoxFit.cover,),
                  SizedBox(height: 10,),
                  Text(source,style: const TextStyle(color: Color(0xFFbababa),fontSize: 20)),
                  SizedBox(height: 10,),
                  Text(description,style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0XFFf2f2f2),
                                    fontFamily: 'Roboto Slab')),
                ],
              ),
            ),
      ),
    );
  }
}
