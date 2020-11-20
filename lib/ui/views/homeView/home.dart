import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
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
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            child: StreamBuilder<List<FlashNews>>(
              stream: model.list,
              builder: (context, snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return snapshot.data[index].getCard();
                  },
                );
              }
            ),
          ),
        ),
        viewModelBuilder: () => HomeViewModel());
  }
}