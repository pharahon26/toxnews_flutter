import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/ui/views/homeView/homeViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Home',
              style: Theme.of(context).textTheme.headline6,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: model.news.length,
                itemBuilder: (context, index) {
                  return model.news[index].getCard();
                },
              )
            ],
          ),
        ),
        viewModelBuilder: () => HomeViewModel());
  }
}