import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/services/NewspaperRepository.dart';
import 'package:toxnews/ui/views/newspaperUnitView/newspaperUnitView.dart';
import 'package:toxnews/ui/widgets/fla_widet.dart';
import 'package:toxnews/ui/widgets/newspaper/newspaperCardViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 16/11/2020.
 */
class NewspaperCardView extends StatefulWidget {
  Newspaper newspaper;
  late DateTime date;



  NewspaperCardView({required this.newspaper}){
    List<String> d = newspaper.date.split('.');
    int day = int.parse(d[0]);
    int month = int.parse(d[1]);
    int year = int.parse(d[2]);
    date = DateTime(year, month, day);
  }

  @override
  _NewspaperCardViewState createState() => _NewspaperCardViewState();
}

class _NewspaperCardViewState extends State<NewspaperCardView> {



  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<NewspaperCardViewModel>.reactive(
        builder: (context, model, child) => Card(
          // color: Theme.of(context).cardColor,
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)
            ),
            child: GestureDetector(
              onTap: () async{
                print('ouvrir le journal');
                print(widget.newspaper.firstPageURL);
                String path = await model.downloadPdfAndNavigate(widget.newspaper);
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewspaperUnitView(path: path)));
              },
              child: Container(
                height: (mediaQuery.size.height *2 )/ 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0x70000000),
                    Color(0x50000000),
                    Color(0x30000000),
                    Color(0x10000000),
                    Color(0x00000000),
                  ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  ),
                  /// IMAGE
                  image: DecorationImage(image: NetworkImage(widget.newspaper.firstPageURL),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.9),
                    ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          /// company
                          Column(
                            children: [
                              Text(widget.newspaper.newsPaperCompany,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.white
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              Text(widget.newspaper.category,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ],
                          ),

                          /// DATE
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              Text('  ${widget.date.day}.${widget.date.month}.${widget.date.year}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      model.isDownloading?
                      Column(
                        children: [
                          CircularProgressIndicator(),
                        ],
                      )
                          :
                      Container(height: 1.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(height: 1.0,),
                          FlagWidet(widget.newspaper.country)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
        viewModelBuilder: () => NewspaperCardViewModel()
    );
  }


}
