import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/generated/l10n.dart';

import 'personalCompanyViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class PersonalCompanyView extends StatefulWidget {
  PersonalCompanyView() : super();

  @override
  _PersonalCompanyViewState createState() => _PersonalCompanyViewState();
}

class _PersonalCompanyViewState extends State<PersonalCompanyView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    S.load(Locale('fr'));

  }

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<PersonalCompanyViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text(
                  'Publishers',
                  style: Theme.of(context).textTheme.headline4,
                ),
                backgroundColor: Theme.of(context).primaryColorDark,
                centerTitle: true,
              ),
              body: Container(
                color: Colors.white,
              ),
            ),
        viewModelBuilder: () => PersonalCompanyViewModel());
  }
}
