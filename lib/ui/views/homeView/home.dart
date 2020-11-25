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
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.headline6,
                ),
                centerTitle: true,
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// companies selection button
                          DropdownButton(
                              dropdownColor:
                                  Theme.of(context).backgroundColor,
                              items: model.companies,
                              value: model.selectedCompany,
                              onChanged: (value) {
                                setState(() {
                                  model.selectedCompany = value;
                                  model.onSort = true;
                                });
                              }),
                          model.onSort
                              ? FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      model.sort();
                                    });
                                  },
                                  minWidth: 15.0,
                                  child: Icon(
                                    Icons.sort,
                                    color: Theme.of(context).accentColor,
                                    size: 24.0,
                                  ),
                                )
                              : Divider(),

                          /// category selection button
                          DropdownButton(
                              dropdownColor:
                                  Theme.of(context).backgroundColor,
                              items: model.categories,
                              value: model.selectedCategory,
                              onChanged: (value) {
                                setState(() {
                                  model.selectedCategory = value;
                                  model.onSort = true;
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      child: StreamBuilder<List<FlashNews>>(
                          stream: model.list,
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return CircularProgressIndicator();
                            }
                            if(snapshot.hasData){
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return snapshot.data[index].getCard();
                                },
                              );
                            }
                            return Text('Waiting');
                          }),
                    ),
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
