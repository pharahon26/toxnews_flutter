import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/generated/l10n.dart';

import 'aboutViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    S.load(Locale('fr'));

  }

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<AboutViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text(
                  S.of(context).pageNameAbout,
                  style: Theme.of(context).textTheme.headline4,
                ),
                backgroundColor: Theme.of(context).primaryColorDark,
                centerTitle: true,
              ),
              body: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          /// Open Source Libraries
                          ListTile(
                            leading: Icon(Icons.info_outline,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            title: Text(S.of(context).buttonOpenSourceLicence,
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Theme.of(context).primaryColorDark,
                            ),
                              onTap: () {
                                /// show dialog
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  // false = user must tap button, true = tap outside dialog
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      title: Text(S.of(context).buttonOpenSourceLicence),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: model.openSourceList.map((e) {
                                            return Text(e,
                                                style: TextStyle(fontSize: 12.0, color: Colors.black )
                                            );
                                          }).toList(),
                                        ),

                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(S.of(context).buttonClose,
                                              style: TextStyle(fontSize: 12.0, color: Theme.of(context).accentColor )
                                          ),
                                          onPressed: () {
                                            Navigator.of(dialogContext)
                                                .pop(); // Dismiss alert dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.supervisor_account_outlined,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            title: Text(S.of(context).textTerms,
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Theme.of(context).primaryColorDark,
                            ),
                              onTap: () {
                                /// show dialog
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  // false = user must tap button, true = tap outside dialog
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      title: Text(S.of(context).textTerms),
                                      content: SingleChildScrollView(
                                        child: Text(S.of(context).textTermsText,
                                            style: TextStyle(fontSize: 12.0, color: Colors.black )
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(S.of(context).buttonClose,
                                              style: TextStyle(fontSize: 12.0, color: Theme.of(context).accentColor )
                                          ),
                                          onPressed: () {
                                            Navigator.of(dialogContext)
                                                .pop(); // Dismiss alert dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.privacy_tip_outlined,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            title: Text(S.of(context).privacy,
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Theme.of(context).primaryColorDark,
                            ),
                              onTap: () {
                                /// show dialog
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  // false = user must tap button, true = tap outside dialog
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      title: Text(S.of(context).privacy),
                                      content: SingleChildScrollView(
                                        child: Text(S.of(context).privacyText,
                                            style: TextStyle(fontSize: 12.0, color: Colors.black )
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(S.of(context).buttonClose,
                                              style: TextStyle(fontSize: 12.0, color: Theme.of(context).accentColor )
                                          ),
                                          onPressed: () {
                                            Navigator.of(dialogContext)
                                                .pop(); // Dismiss alert dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                          ),

                        ],
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(20.0),
                      child: Text('${S.of(context).appTitle} ${S.of(context).appVersion}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 16.0
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
        viewModelBuilder: () => AboutViewModel());
  }
}
