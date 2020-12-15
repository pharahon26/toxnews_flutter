import 'package:flutter/cupertino.dart';
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
    var mediaQuery = MediaQuery.of(context);
    return Card(
      // color: Theme.of(context).cardColor,
      color: Colors.white70,
      elevation: 2,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8.0)
      // ),
      child: Container(
        height: mediaQuery.size.height/3,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(flashNews.mediaLink),
            fit: BoxFit.fill
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Color(0x00000000),
              ],
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(flashNews.title,
                        style: Theme.of(context).textTheme.headline4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(flashNews.news,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.web,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(flashNews.company.split('.').first.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Expanded(child: Container()),
                        Text('${date.day}.${date.month}.${date.year}',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white70
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
