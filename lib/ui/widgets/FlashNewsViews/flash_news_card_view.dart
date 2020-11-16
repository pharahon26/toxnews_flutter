import 'package:flutter/material.dart';
import 'package:toxnews/models/FlashNews.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 16/11/2020.
 */
class FlashNewsCardView extends StatelessWidget {
  FlashNews flashNews;
  DateTime date;

  FlashNewsCardView({this.flashNews}){
    date = DateTime.fromMillisecondsSinceEpoch(flashNews.creationDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 75.0,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${flashNews.title} ${date.day}/${date.month}'),
              Text(flashNews.news),
            ],
          ),
        ),
      )
    );
  }
}
