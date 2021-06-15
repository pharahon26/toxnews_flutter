import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/models/NewspaperCompany.dart';
import 'package:toxnews/ui/views/companyUnitView/companyUnitViewModel.dart';
import 'package:toxnews/ui/widgets/fla_widet.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class CompanyUnitView extends StatefulWidget {
  String companyId;

  CompanyUnitView({required this.companyId}) : super();

  @override
  _CompanyUnitViewState createState() => _CompanyUnitViewState();
}

class _CompanyUnitViewState extends State<CompanyUnitView> {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyUnitViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder<NewspaperCompany>(
            future: model.company,
            builder: (context, snapshot) {
              return Scaffold(
                body: SafeArea(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      NewspaperCompany company = snapshot.data!;
                      return NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverAppBar(
                            backgroundColor: Colors.white,
                            automaticallyImplyLeading: false,
                            expandedHeight: 200,
                            centerTitle: true,
                            pinned: true,
                            floating: true,
                            elevation: 5,
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(company.name.toUpperCase(),
                                  style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 18),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.location_on_outlined, color: Theme.of(context).primaryColor,),
                                SizedBox(width: 5,),
                                FlagWidet(company.country),
                                SizedBox(width: 2.5,),
                                Text(company.city,
                                  style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 14),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            flexibleSpace: Stack(
                              children:[
                                Image.network(company.logoURL,
                                fit: BoxFit.cover,
                              ),
                                Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: ElevatedButton(
                                    onPressed: () {  },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight)
                                    ),
                                    child: Text('Subscribe',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white)
                                    ),
                                  ),
                                )
                              ]
                            ),
                          )
                        ],
                        body: SingleChildScrollView(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight:constraints.maxHeight
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Stack(
                                  //   children: [
                                  //
                                  //     /// FOLLOW
                                  //     Positioned(
                                  //       right: 0,
                                  //       bottom: 0,
                                  //       child: ,
                                  //     ),
                                  //
                                  //   ],
                                  // ),
                                  /// NAME + FOLLOW
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.max,
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Row(
                                  //         mainAxisSize: MainAxisSize.min,
                                  //         mainAxisAlignment: MainAxisAlignment.start,
                                  //         children: [
                                  //           Text(company.name.toUpperCase(),
                                  //             style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 18),
                                  //             softWrap: true,
                                  //             overflow: TextOverflow.ellipsis,
                                  //             maxLines: 1,
                                  //           ),
                                  //           SizedBox(width: 10,),
                                  //           Icon(Icons.location_on_outlined),
                                  //           SizedBox(width: 5,),
                                  //           FlagWidet(company.country),
                                  //           SizedBox(width: 2.5,),
                                  //           Text(company.city,
                                  //             style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 14),
                                  //             softWrap: true,
                                  //             overflow: TextOverflow.ellipsis,
                                  //             maxLines: 1,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       /// FOLLOW
                                  //       ElevatedButton(
                                  //         onPressed: () {  },
                                  //         style: ButtonStyle(
                                  //             backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight)
                                  //         ),
                                  //         child: Text('Follow',
                                  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white)
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  /// MORE
                                  IconButton(icon: Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColorLight,),
                                      alignment: Alignment.center,
                                      // Icon(widget.flashNews.isCommented()? Icons.comment :Icons.comment_outlined, color: Theme.of(context).primaryColor,),
                                      onPressed: () {}
                                  ),
                                  /// extern actions
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            IconButton(icon: Icon(Icons.phone, color: Theme.of(context).accentColor,),
                                                onPressed: () {}),
                                            IconButton(icon: Icon(Icons.mail, color: Theme.of(context).accentColor),
                                                onPressed: () {}),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {  },
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor)
                                          ),
                                          child: Text('Follow',
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  /// ACTIONS
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      /// LIKE
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(icon: Icon(Icons.favorite_outline, color: Theme.of(context).primaryColor,),
                                              // Icon(widget.flashNews.isLiked()? Icons.favorite : Icons.favorite_outline, color: Theme.of(context).primaryColor,),
                                              onPressed: () {}
                                          ),
                                          Text(company.likes.toString())
                                        ],
                                      ),
                                      /// WATCH
                                      IconButton(icon: Icon(LineIcons.eyeSlashAlt),
                                          onPressed: () {}
                                      ),
                                      /// TREND
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(icon: Icon(Icons.local_fire_department_outlined, color: Theme.of(context).primaryColor,),
                                              // Icon(widget.flashNews.hadTrend()? Icons.local_fire_department_rounded :Icons.local_fire_department_outlined, color: Theme.of(context).primaryColor,),
                                              onPressed: () {}),
                                          Text(company.trends.toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                  /// COMMENT
                                  IconButton(icon: Icon(Icons.comment_outlined, color: Theme.of(context).primaryColorLight,),
                                      alignment: Alignment.centerRight,
                                      // Icon(widget.flashNews.isCommented()? Icons.comment :Icons.comment_outlined, color: Theme.of(context).primaryColor,),
                                      onPressed: () {}
                                  ),
                                  Placeholder(
                                    // comments list
                                  ),
                                  /// news title
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('News',
                                            style: TextStyle(fontSize: 14, color: Colors.black87)
                                        ),
                                      ),
                                      TextButton(onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('See all',
                                                style: TextStyle(fontSize: 14, color: Theme.of(context).accentColor)
                                            ),
                                          ),)
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: FutureBuilder<List<FlashNews>>(
                                        future: model.newspaperList,
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
                                  ),
                                  /// newspapers title
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Newspapers',
                                            style: TextStyle(fontSize: 14, color: Colors.black87)
                                        ),
                                      ),
                                      TextButton(onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('See all',
                                                style: TextStyle(fontSize: 14, color: Theme.of(context).accentColor)
                                            ),
                                          ),)
                                    ],
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: FutureBuilder<List<Newspaper>>(
                                          future: model.newspaperList,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ) ;
                    },
                  ),
                )
              );
            }
          ),
        ),
        viewModelBuilder: () => CompanyUnitViewModel(widget.companyId)
    );
  }
}