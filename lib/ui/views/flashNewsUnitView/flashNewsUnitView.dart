import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/ui/views/flashNewsUnitView/flashNewsUnitViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class FlashNewsUnitView extends StatefulWidget {
  FlashNews news;
  FlashNewsUnitView({Key key, FlashNews news}) : super(key: key){
   this.news = news;
  }

  @override
  _FlashNewsUnitViewState createState() => _FlashNewsUnitViewState();
}

class _FlashNewsUnitViewState extends State<FlashNewsUnitView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FlashNewsUnitViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Flash News',
              style: Theme.of(context).textTheme.headline6,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(model.news.company, style: Theme.of(context).textTheme.headline6,),
              SizedBox(
                height: 8.0,
              ),
              Stack(
                children: [
                  Container(width: double.infinity, child: Image.network(model.news.mediaLink)),
                  Text(model.news.title, style: Theme.of(context).textTheme.bodyText1,),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(model.news.news, style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
        ),
        viewModelBuilder: () => FlashNewsUnitViewModel(news: widget.news)
    );
  }
}