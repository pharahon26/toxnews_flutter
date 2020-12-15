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
                automaticallyImplyLeading: false,
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.headline6,
                ),
                centerTitle: true,
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              body: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)
                          )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// companies selection button
                            PopupMenuButton(
                                child: Row(
                                  children: [
                                    Icon(Icons.web, color: Colors.white,),
                                    Text(model.selectedCompany, style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                                color: Theme.of(context).primaryColor,
                                onSelected: (val){setState(() {
                                  model.selectedCompany = val;
                                  model.sort();
                                });},
                                itemBuilder: (BuildContext context) {
                                  return model.companiesList.map((e) => PopupMenuItem(child: Text(e), value: e, textStyle: TextStyle(color: Colors.black),)).toList();
                                }
                            ),
                            // FlatButton.icon(
                            //         onPressed: () {
                            //           setState(() {
                            //             showDatePicker(context: this.context,
                            //                 initialDate: DateTime.now(),
                            //                 firstDate: DateTime(2000),
                            //                 lastDate: DateTime(2050))
                            //                 .then((value)  {
                            //               if(value != null){
                            //                 setState(() {
                            //                   model.date = value;
                            //                   model.dateString = '${value.day}.${value.month}.${value.year}';
                            //                   model.sort();
                            //                 });
                            //               }
                            //             });
                            //           });
                            //         },
                            //         minWidth: 15.0,
                            //         label: Text(model.dateString, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            //         icon: Icon(
                            //           Icons.date_range,
                            //           color: Colors.black,
                            //           size: 24.0,
                            //         ),
                            //       ),

                            /// category selection button
                            PopupMenuButton(
                                child: Row(
                                  children: [
                                    Icon(Icons.turned_in_not_outlined, color: Colors.white,),
                                    Text(model.selectedCategory, style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                                color: Theme.of(context).primaryColor,
                                onSelected: (val){setState(() {
                                  model.selectedCategory = val;
                                  model.sort();
                                });},
                                itemBuilder: (BuildContext context) {
                                  return model.categoriesList.map((e) => PopupMenuItem(child: Text(e), value: e, textStyle: TextStyle(color: Colors.black),)).toList();
                                }
                            ),

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
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
