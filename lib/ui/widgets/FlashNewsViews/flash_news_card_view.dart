import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/ui/widgets/FlashNewsViews/flashNewsCardViewModel.dart';
import 'package:toxnews/ui/widgets/fla_widet.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 16/11/2020.
 */
class FlashNewsCardView extends StatefulWidget {
  FlashNews flashNews;
  late DateTime date;

  FlashNewsCardView({required this.flashNews}){
    date = DateTime.fromMillisecondsSinceEpoch(flashNews.creationDate);
  }

  @override
  _FlashNewsCardViewState createState() => _FlashNewsCardViewState();
}

class _FlashNewsCardViewState extends State<FlashNewsCardView> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<FlashNewsCardViewModel>.reactive(
      builder:(context, model, child) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// CARD
          ClipRect(
            child: GestureDetector(
              onTap: () => model.navigateToArticle(),
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
                                child: Text(widget.flashNews.title,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColorDark
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              /// DATE
                              Text('  ${widget.date.day}.${widget.date.month}.${widget.date.year}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),

                              ),
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Icon(
                              //       Icons.date_range,
                              //       color: Colors.black,
                              //       size: 12.0,
                              //     ),
                              //     Text('  ${widget.date.day}.${widget.date.month}.${widget.date.year}',
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //         color: Colors.black,
                              //       ),
                              //
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                          /// COMPANY AND FLAG
                          GestureDetector(
                            onTap: () => model.navigateToCompany(widget.flashNews.company),
                            child: Chip(
                              avatar: FlagWidet(FlagWidet.BURKINA_FASO),
                              label: Text(widget.flashNews.company.split('.').first.toUpperCase(),
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
                        child: Image.network(widget.flashNews.mediaLink,
                          fit: BoxFit.fill,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      /// NEWS TEXT
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.flashNews.news,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black87
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
          /// ACTIONS
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// LIKE
              IconButton(icon: Icon(Icons.favorite_outline, color: Theme.of(context).primaryColor,),
                  // Icon(widget.flashNews.isLiked()? Icons.favorite : Icons.favorite_outline, color: Theme.of(context).primaryColor,),
                  onPressed: () => model.like()
              ),
              /// UNLIKE
              IconButton(icon: LineIcon(LineIcons.heartBroken),
                  onPressed: () => model.unlike()
              ),
              /// COMMENT
              IconButton(icon: Icon(Icons.comment_outlined, color: Theme.of(context).primaryColor,),
              // Icon(widget.flashNews.isCommented()? Icons.comment :Icons.comment_outlined, color: Theme.of(context).primaryColor,),
                  onPressed: () => model.comment('test comment')
              ),
              /// WATCH
              IconButton(icon: Icon(LineIcons.eyeSlashAlt),
                  onPressed: () => model.watch()
              ),
              /// TREND
              IconButton(icon: Icon(Icons.local_fire_department_outlined, color: Theme.of(context).primaryColor,),
              // Icon(widget.flashNews.hadTrend()? Icons.local_fire_department_rounded :Icons.local_fire_department_outlined, color: Theme.of(context).primaryColor,),
                  onPressed: () => model.trend()
              ),


            ],
          )
        ],
      ),
      viewModelBuilder: () => FlashNewsCardViewModel(widget.flashNews),
    );
  }
}
