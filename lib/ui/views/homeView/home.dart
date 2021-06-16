import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/generated/l10n.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/ui/views/homeView/homeViewModel.dart';
import 'package:toxnews/ui/widgets/fla_widet.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class Home extends StatefulWidget {
  Home() : super();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int tabIndex = 0;
  int _floatIcon  = 0;
  bool _isFilter = false;
  String _country = FlagWidet.BURKINA_FASO;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
        });
      });
    super.initState();
    S.load(Locale('fr'));
  }

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              // appBar: AppBar(
              //   automaticallyImplyLeading: false,
              //   title: Text(
              //     S.of(context).pageNameHome,
              //     style: Theme.of(context).textTheme.headline4,
              //   ),
              //   actions: [
              //     Padding(padding: EdgeInsets.only(right: 20.0),
              //       child: GestureDetector(
              //         child: Icon(Icons.info_outline),
              //         onTap: () => model.navigateToAbout(),
              //       ),
              //     )
              //   ],
              //   actionsIconTheme: IconThemeData(
              //     size: 25.0,
              //     color: Colors.white
              //   ),
              //   backgroundColor: Theme.of(context).primaryColorDark,
              //   centerTitle: true,
              // ),
              extendBodyBehindAppBar: true,
              body: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.white,
                child: StreamBuilder<List<FlashNews>>(
                  stream: model.flashNewsList,
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: LinearProgressIndicator(),
                        ),
                      );
                    }
                    if(snapshot.connectionState == ConnectionState.none){
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: LinearProgressIndicator(),
                        ),
                      );
                    }
                    if(snapshot.connectionState == ConnectionState.active){
                      return NestedScrollView(
                        floatHeaderSlivers: true,
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [SliverAppBar(
                          backgroundColor: Colors.white,
                          automaticallyImplyLeading: false,
                          snap: true,
                          floating: true,
                          elevation: 5,
                          leading: IconButton(icon: Icon(_isFilter? Icons.filter_list : Icons.update, color: Theme.of(context).primaryColorLight,),
                            onPressed: () {setState(() {
                              _isFilter = !_isFilter;
                            });},

                          ),
                          title: _isFilter?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// companies selection button
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PopupMenuButton(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    child: Row(
                                      children: [
                                        // Icon(Icons.brush, color: Theme.of(context).primaryColorLight,),
                                        Text(model.selectedCompany, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColorLight),),
                                      ],
                                    ),
                                    color: Colors.white,
                                    onSelected: (val){setState(() {
                                      model.selectedCompany = val.toString();
                                      model.sort();
                                    });},
                                    itemBuilder: (BuildContext context) {
                                      return model.companiesList.map((e) => PopupMenuItem(
                                        child: Text(e),
                                        value: e,
                                        textStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                                      )).toList();
                                    }
                                ),
                              ),
                              /// country
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PopupMenuButton(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    child: FlagWidet(_country),
                                    color: Colors.white,
                                    onSelected: (val){setState(() {
                                      _country = val.toString();
                                    });},
                                    itemBuilder: (BuildContext context) {
                                      return [FlagWidet.BURKINA_FASO, FlagWidet.COTE_D_IVOIRE].map((e) => PopupMenuItem(
                                        child: FlagWidet(e),
                                        value: e,
                                      )).toList();
                                    }
                                ),
                              ),

                              /// category selection button
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PopupMenuButton(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0)
                                    ),
                                    child: Row(
                                      children: [
                                        // Icon(Icons.account_tree_outlined, color: Theme.of(context).primaryColorLight,),
                                        Text(model.selectedCategory, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColorLight),),
                                      ],
                                    ),
                                    color: Colors.white,
                                    onSelected: (val){setState(() {
                                      model.selectedCategory = val.toString();
                                      model.sort();
                                    });},
                                    itemBuilder: (BuildContext context) {
                                      return model.categoriesList.map((e) => PopupMenuItem(
                                        child: Text(e),
                                        value: e,
                                        textStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                                      )).toList();
                                    }
                                ),
                              ),
                            ],
                          )
                              :
                          TextButton(
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Icon(
                                //   Icons.date_range,
                                //   color: Theme.of(context).primaryColor,
                                //   size: 20.0,
                                // ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(model.dateString,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.search, color: Theme.of(context).primaryColorLight,),
                            ),
                            GestureDetector(
                              onTap: () => model.navigateToProfile(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.person_outline, color: Theme.of(context).primaryColorLight,),
                              ),
                            )
                          ],
                          centerTitle: true,
                          bottom: TabBar(
                              indicatorColor: Theme.of(context).accentColor,
                              labelColor: Theme.of(context).accentColor,
                              unselectedLabelColor: Theme.of(context).primaryColor,
                              controller: _tabController,
                              tabs: [
                                Tab(text: 'News', icon: Icon(Icons.article),),
                                Tab(text: 'Newspapers', icon: Icon(Icons.auto_stories))
                              ]
                          ),

                        )],
                        /// Tab View
                        body: SafeArea(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              StreamBuilder<List<FlashNews>>(
                                  stream: model.flashNewsList,
                                  builder: (context, snapshot) {
                                    if(snapshot.connectionState == ConnectionState.waiting){
                                      return Center(
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: LinearProgressIndicator(),
                                        ),
                                      );
                                    }
                                    if(snapshot.connectionState == ConnectionState.none){
                                      return Center(
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: LinearProgressIndicator(),
                                        ),
                                      );
                                    }
                                    if(snapshot.hasData){
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return snapshot.data![index].getCard();
                                        },
                                      );
                                    }
                                    return Text('Waiting');
                                  }),
                              StreamBuilder<List<Newspaper>>(
                                  stream: model.newspaperList,
                                  builder: (context, snapshot) {
                                    if(snapshot.connectionState == ConnectionState.waiting){
                                      return Center(
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: LinearProgressIndicator(),
                                        ),
                                      );
                                    }
                                    if(snapshot.connectionState == ConnectionState.none){
                                      return Center(
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: LinearProgressIndicator(),
                                        ),
                                      );
                                    }
                                    if(snapshot.hasData){
                                      return ListView.builder(
                                        shrinkWrap: false,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return snapshot.data![index].getCard();
                                        },
                                      );
                                    }
                                    return Text('Waiting');
                                  }),
                            ],
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(),
                      ),
                    );

                  }
                ),
              ),
              floatingActionButton: FloatingActionButton(onPressed: () {
                setState(() {
                  switchIcon();
                });
              },
                  child: Icon(_floatIcon == 0? Icons.language: _floatIcon == 1? Icons.favorite : Icons.local_fire_department_sharp),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }

  void switchIcon(){
    if(_floatIcon == 2){
      _floatIcon = 0;
    } else{
      _floatIcon++;
    }
  }
}
