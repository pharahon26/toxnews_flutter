import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/generated/l10n.dart';

import 'proofilViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class ProfileView extends StatefulWidget {
  ProfileView() : super();

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  void initState() {
    super.initState();
    S.load(Locale('fr'));

  }

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<ProfileViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              // appBar: AppBar(
              //   automaticallyImplyLeading: true,
              //   title: Text(
              //     S.of(context).pageNameAbout,
              //     style: Theme.of(context).textTheme.headline4,
              //   ),
              //   backgroundColor: Theme.of(context).primaryColorDark,
              //   centerTitle: true,
              // ),
              body: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
                        ),

                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            /// Open Source Libraries
                            ListTile(
                              leading: Icon(Icons.person_outline,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              title: Text(S.of(context).buttonName,
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
                                      return Container();
                                    },
                                  );
                                }
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.person_outline,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              title: Text(S.of(context).buttonName,
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
                                          TextButton(
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
                              leading: Icon(Icons.phone,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              title: Text('Phone',
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
                                          TextButton(
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
                    ),

                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                        onTap: () {  },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              color: Theme.of(context).primaryColor,
                                child: Text('Modify', style: TextStyle(fontSize: 16, color: Colors.white),))
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
        viewModelBuilder: () => ProfileViewModel());
  }
}
