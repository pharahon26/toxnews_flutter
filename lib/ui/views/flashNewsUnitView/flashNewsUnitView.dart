import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/generated/l10n.dart';
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
          backgroundColor: Colors.white,
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
                      Image.network(model.news.companyLogoURL,
                        fit: BoxFit.cover,
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
                              /// IMAGE
                              Container(width: double.infinity,
                                  child: Hero(
                                    tag: model.news.id,
                                    child: Image.network(model.news.mediaLink,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                              SizedBox(
                                height: 12.0,
                              ),
                              /// TITLE
                              Text(model.news.title,
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark),),
                              SizedBox(
                                height: 12.0,
                              ),

                              /// NEWS
                              Text(model.news.news,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 15.0,
                                    color: Colors.black,
                                    // letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          color: Theme.of(context).primaryColorDark,
                          elevation: 3.0,
                          child: Text(S.of(context).buttonReachBase,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          onPressed: (){
                            model.reachBase();
                          },
                          // shape: OutlineInputBorder(
                          //   gapPadding: 3.0,
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColorDark,
                          //   )
                          // ),
                        ),
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