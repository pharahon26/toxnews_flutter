import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/ui/widgets/fla_widet.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 16/11/2020.
 */
class FlashNewsCardView extends StatelessWidget {
  FlashNews flashNews;
  late DateTime date;
  final NavigationService _navigationService = locator<NavigationService>();



  FlashNewsCardView({required this.flashNews}){
    date = DateTime.fromMillisecondsSinceEpoch(flashNews.creationDate);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ClipRect(
      child: GestureDetector(
        onTap: (){
          _navigationService.navigateTo(Routes.flashNewsUnitView, arguments: FlashNewsUnitViewArguments(news: flashNews));
        },
        child: Card(
          // color: Theme.of(context).cardColor,
          color: Colors.white,
          elevation: 5,
          child: Container(
            height: mediaQuery.size.height/3,
            width: double.infinity,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(

              // gradient: LinearGradient(colors: [
              //   Color(0x60000000),
              //   Color(0x00000000),
              // ],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter
              // ),
              /// IMAGE
              // image: DecorationImage(image: NetworkImage(flashNews.mediaLink),
              //   fit: BoxFit.cover,
              //   alignment: Alignment.topCenter,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// NEWS TITLE AND COMPANY
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Container(
                          padding: EdgeInsets.all(5),
                          width: mediaQuery.size.width * 0.5,
                          child: Text(flashNews.title,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        /// DATE
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        // _navigationService.navigateTo(Routes.companyUnitView, arguments: CompanyUnitViewArguments(company: flashNews));
                      },
                      child: Chip(
                        avatar: FlagWidet(FlagWidet.BURKINA_FASO),
                        label: Text(flashNews.company.split('.').first.toUpperCase(),
                          style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 12),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        backgroundColor: Colors.white ,
                        side: BorderSide(color: Theme.of(context).primaryColor ),
                      ),
                    ),
                  ],
                ),
                ///Image
                Expanded(
                  child: Image.network(flashNews.mediaLink,
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
                /// NEWS TEXT
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(flashNews.news,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
