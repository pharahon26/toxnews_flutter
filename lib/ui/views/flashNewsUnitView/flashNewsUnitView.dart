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
          backgroundColor: Theme.of(context).cardColor,
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColorDark,
                expandedHeight: 200,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(model.news.company.split('.').first, style: Theme.of(context).textTheme.headline4,),
                  centerTitle: true,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: model.news.id,
                        child: Image.network(model.news.companyLogoURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment(0.0, 0.0),
                          colors: [
                            Color(0x60000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),

                    ),
                  ]
                  )),
                ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 8.0,
                      ),
                      /// image and Title
                      Expanded(
                        flex: 19,
                        child: Container(
                          child: Column(
                            children: [
                              Text(model.news.title, style: Theme.of(context).textTheme.headline3,),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(width: double.infinity,
                                  child: Image.network(model.news.mediaLink,
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(model.news.news,
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      FlatButton(
                        child: Text('Read the original article',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        onPressed: (){
                          model.reachBase();
                        },
                      ),
                      /// news Text
                    ]
                )),
              ),
            ],
          ),
        ),
        viewModelBuilder: () => FlashNewsUnitViewModel(news: widget.news)
    );
  }
}