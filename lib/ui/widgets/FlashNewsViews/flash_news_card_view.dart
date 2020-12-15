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
      elevation: 5,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8.0)
      // ),
      child: Container(
        height: mediaQuery.size.height/3,
        width: double.maxFinite,
        decoration: BoxDecoration(
          /// IMAGE
          image: DecorationImage(image: NetworkImage(flashNews.mediaLink),
            fit: BoxFit.fill
          ),
        ),
        child: Container(
            color: Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  /// NEWS TITLE
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(

                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(flashNews.title,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  /// NEWS TEXT
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(flashNews.news,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        /// COMPANY NAME
                        Icon(Icons.web,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(flashNews.company.split('.').first.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Expanded(child: Container()),
                        /// DATE
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Theme.of(context).primaryColor,
                              size: 12.0,
                            ),
                            Text('  ${date.day}.${date.month}.${date.year}',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
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
