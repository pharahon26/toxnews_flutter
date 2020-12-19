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
                backgroundColor: Theme.of(context).primaryColorDark,
                centerTitle: true,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Date Button
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  showDatePicker(context: this.context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2050))
                                      .then((value)  {
                                    if(value != null){
                                      setState(() {
                                        model.date = value;
                                        model.dateString = '${value.day}.${value.month}.${value.year}';
                                        model.sort();
                                      });
                                    }
                                  });
                                });
                              },
                              padding: EdgeInsets.all(8.0),
                              color: Theme.of(context).primaryColorDark,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(model.dateString,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      fontSize: 16.0
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  /// companies selection button
                                  PopupMenuButton(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0)
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.web, color: Theme.of(context).primaryColorDark,),
                                          Text(model.selectedCompany, style: TextStyle(color: Theme.of(context).primaryColorDark),),
                                        ],
                                      ),
                                      color: Colors.white,
                                      onSelected: (val){setState(() {
                                        model.selectedCompany = val;
                                        model.sort();
                                      });},
                                      itemBuilder: (BuildContext context) {
                                        return model.companiesList.map((e) => PopupMenuItem(
                                          child: Text(e),
                                          value: e,
                                          textStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                                        )).toList();
                                      }
                                  ),

                                  /// category selection button
                                  PopupMenuButton(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0)
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.turned_in_not_outlined, color: Theme.of(context).primaryColorDark,),
                                          Text(model.selectedCategory, style: TextStyle(color: Theme.of(context).primaryColorDark),),
                                        ],
                                      ),
                                      color: Colors.white,
                                      onSelected: (val){setState(() {
                                        model.selectedCategory = val;
                                        model.sort();
                                      });},
                                      itemBuilder: (BuildContext context) {
                                        return model.categoriesList.map((e) => PopupMenuItem(
                                          child: Text(e),
                                          value: e,
                                          textStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                                        )).toList();
                                      }
                                  ),
                                ],
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8.0),
                        child: StreamBuilder<List<FlashNews>>(
                            stream: model.list,
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }
                              if(snapshot.connectionState == ConnectionState.none){
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
