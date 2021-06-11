import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/NewspaperCompany.dart';
import 'package:toxnews/ui/views/companyUnitView/companyUnitViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class CompanyUnitView extends StatefulWidget {
  NewspaperCompany company;

  CompanyUnitView({required this.company}) : super();

  @override
  _CompanyUnitViewState createState() => _CompanyUnitViewState();
}

class _CompanyUnitViewState extends State<CompanyUnitView> {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyUnitViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container()
          ),
        ),
        viewModelBuilder: () => CompanyUnitViewModel(widget.company)
    );
  }
}