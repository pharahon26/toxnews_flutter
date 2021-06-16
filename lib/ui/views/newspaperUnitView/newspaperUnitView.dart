import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/ui/views/newspaperUnitView/newspaperUnitViewModel.dart';
import 'package:toxnews/ui/widgets/toxNewsCompanyTitleWidget.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class NewspaperUnitView extends StatefulWidget {
  Newspaper newspaper;

  NewspaperUnitView({required this.newspaper}) : super();

  @override
  _NewspaperUnitViewState createState() => _NewspaperUnitViewState();
}

class _NewspaperUnitViewState extends State<NewspaperUnitView> {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewspaperUnitViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              // height: (mediaQuery.size.height *2 )/ 3,
              decoration: BoxDecoration(

                /// IMAGE
                image: DecorationImage(image: NetworkImage(widget.newspaper.firstPageURL),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.9),
                    Color(0x300000),
                    Color(0x000000),
                    Color(0x300000),
                    Colors.white.withOpacity(0.9),
                  ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        /// company
                        Column(
                          children: [
                            ToxNewsCompanyTitleWidget(
                                name: model.newspaper.newsPaperCompany.split('.').last,
                                country: model.newspaper.country,
                                city: ' '),
                            /// DATE
                            Row(
                              children: [
                                Text('  ${model.date.day}.${model.date.month}.${model.date.year}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(widget.newspaper.category,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black87
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    model.isDownloading?
                    Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                        :
                    Container(height: 1.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// buy
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () async {
                              if(model.isDownloading){
                                print('non au doublon');
                              }else{
                                setState(() {
                                  model.isDownloading = true;
                                  }
                                );
                              }
                              String path = await model.downloadPdfAndNavigate();
                              setState(() {
                                model.isDownloading = false;
                              });
                                model.downloadPdfAndNavigate();
                              },
                            child: Text('Download',style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight)
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ),
        ),
        viewModelBuilder: () => NewspaperUnitViewModel(widget.newspaper)
    );
  }
}