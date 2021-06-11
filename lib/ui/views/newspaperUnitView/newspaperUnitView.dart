import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/ui/views/newspaperUnitView/newspaperUnitViewModel.dart';

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
            child: Container()
          ),
        ),
        viewModelBuilder: () => NewspaperUnitViewModel(widget.newspaper)
    );
  }
}