import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/ui/views/flashNewsUnitView/flashNewsUnitView.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 16/11/2020.
 */
class FlashNewsCardView extends StatelessWidget {
  FlashNews flashNews;
  late DateTime date;


  FlashNewsCardView({required this.flashNews}){
    date = DateTime.fromMillisecondsSinceEpoch(flashNews.creationDate);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Card(
      // color: Theme.of(context).cardColor,
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FlashNewsUnitView(news: flashNews)));
        },
        child: Container(
          height: mediaQuery.size.height/3,
          width: double.infinity,
          // padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(

            gradient: LinearGradient(colors: [
              Color(0x60000000),
              Color(0x00000000),
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
            /// IMAGE
            image: DecorationImage(image: NetworkImage(flashNews.mediaLink),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              /// News Picture
              Expanded(
                flex: 1,
                child: Container(
                  // tag: flashNews.id,
                  // child: Image.network(flashNews.mediaLink,
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  //   alignment: Alignment.topCenter,
                  // ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// NEWS TITLE
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(flashNews.title,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    /// NEWS TEXT
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(flashNews.news,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          /// COMPANY NAME
                          Icon(Icons.web,
                            color: Theme.of(context).accentColor,
                          ),
                          Text(flashNews.company.split('.').first.toUpperCase(),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Expanded(child: Container()),
                          /// DATE
                          Icon(
                            Icons.date_range,
                            color: Colors.black,
                            size: 12.0,
                          ),
                          Text('  ${date.day}.${date.month}.${date.year}',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
