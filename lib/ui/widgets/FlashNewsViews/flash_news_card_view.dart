import 'package:flutter/material.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/ui/views/flashNewsUnitView/flashNewsUnitView.dart';

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
      color: Theme.of(context).cardColor,
      child: Container(
        height: 150.0,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(flashNews.mediaLink),
                  flex: 2,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(flashNews.title,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text('${date.day}/${date.month}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                          child: Text(flashNews.news,
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                      ),
                    ],
                  ),
                ),

              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FlashNewsUnitView(news: flashNews,)));
            },
          ),
        ),
      )
    );
  }
}
