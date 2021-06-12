import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:toxnews/generated/l10n.dart';

import 'profileViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class ProfileView extends StatefulWidget {
  ProfileView() : super();

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {


  GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _mailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();

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
              appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headline4,
                ),
                actions: [
                  GestureDetector(
                    onTap: () => model.navigateToAbout(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings, color: Colors.white,),
                    ),
                  )
                ],
                backgroundColor: Theme.of(context).primaryColorDark,
                centerTitle: true,
              ),
              body: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// Image
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                      ),

                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// USER INFORMATION
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Mes Informations',
                                  style: TextStyle(fontSize: 14, color: Colors.black87)
                              ),
                            ),
                            /// USER FORM
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                /// USERNAME
                                ListTile(
                                    title: Text('Change username',
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    // trailing: Icon(Icons.create_sharp,
                                    //     color: Colors.black
                                    // ),
                                    onTap: () {
                                      /// show dialog
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        // false = user must tap button, true = tap outside dialog
                                        builder: (BuildContext dialogContext) {
                                          String newName = '';
                                          return AlertDialog(
                                            title: Text('Change Username'),
                                            content: Form(
                                              key: _nameFormKey,
                                              child: TextFormField(
                                                initialValue: model.user.name,
                                                keyboardType: TextInputType.name,
                                                decoration: InputDecoration(
                                                  labelText: 'Username',
                                                  labelStyle: TextStyle(fontSize: 14, color: Colors.black87),
                                                ),
                                                onChanged: (text) {
                                                  setState(() {
                                                    newName = text;
                                                  });
                                                },
                                                validator: (newUsername) {
                                                  /// validate the name
                                                  if (newUsername!.length < 1) {
                                                    return 'The name can not be empty';
                                                  }
                                                  if (newUsername == model.user.name) {
                                                    return 'The name have not change';
                                                  }
                                                  return null;
                                                },
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
                                              TextButton(
                                                child: Text('Modifier',
                                                    style: TextStyle(fontSize: 12.0, color: Theme.of(context).primaryColor)
                                                ),
                                                onPressed: () {
                                                  if(_nameFormKey.currentState!.validate()){
                                                    model.changeName(newName);
                                                    Navigator.of(dialogContext)
                                                        .pop(); // Dismiss alert dialog
                                                  }
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                ),
                                /// MAIL
                                ListTile(
                                    title: Text('Change mail',
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    // trailing: Icon(Icons.create_sharp,
                                    //     color: Colors.black
                                    // ),
                                    onTap: () {
                                      /// show dialog
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        // false = user must tap button, true = tap outside dialog
                                        builder: (BuildContext dialogContext) {
                                          String newMail = '';
                                          return AlertDialog(
                                            title: Text('Change mail'),
                                            content: Form(
                                              key: _mailFormKey,
                                              child: TextFormField(
                                                initialValue: model.user.mail,
                                                keyboardType: TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  labelText: 'Mail',
                                                  labelStyle: TextStyle(fontSize: 14, color: Colors.black87),
                                                ),
                                                onChanged: (text) {
                                                  setState(() {
                                                    newMail = text;
                                                  });
                                                },
                                                validator: (newMail) {
                                                  /// validate the mail
                                                  if (newMail!.length < 1) {
                                                    return 'The mail can not be empty';
                                                  }
                                                  if (newMail == model.user.mail) {
                                                    return 'The mail have not change';
                                                  }
                                                  return null;
                                                },
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
                                              TextButton(
                                                child: Text('Modifier',
                                                    style: TextStyle(fontSize: 12.0, color: Theme.of(context).primaryColor)
                                                ),
                                                onPressed: () {
                                                  if(_mailFormKey.currentState!.validate()){
                                                    model.changeMail(newMail);
                                                    Navigator.of(dialogContext)
                                                        .pop(); // Dismiss alert dialog
                                                  }
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                ),
                                /// PHONE
                                ListTile(
                                    title: Text('Change phone',
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    // trailing: Icon(Icons.create_sharp,
                                    //     color: Colors.black
                                    // ),
                                    onTap: () {
                                      /// show dialog
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        // false = user must tap button, true = tap outside dialog
                                        builder: (BuildContext dialogContext) {
                                          String newPhone = '';
                                          return AlertDialog(
                                            title: Text('Change phone'),
                                            content: Form(
                                              key: _phoneFormKey,
                                              child: TextFormField(
                                                initialValue: model.user.number,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: 'Phone',
                                                  labelStyle: TextStyle(fontSize: 14, color: Colors.black87),
                                                ),
                                                onChanged: (text) {
                                                  setState(() {
                                                    newPhone = text;
                                                  });
                                                },
                                                validator: (newPhone) {
                                                  /// validate the phone
                                                  if (newPhone!.length < 8) {
                                                    return 'It is not a valid number';
                                                  }
                                                  if (newPhone == model.user.number) {
                                                    return 'The phone number have not change';
                                                  }
                                                  return null;
                                                },
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
                                              TextButton(
                                                child: Text('Modifier',
                                                    style: TextStyle(fontSize: 12.0, color: Theme.of(context).primaryColor)
                                                ),
                                                onPressed: () {
                                                  if(_mailFormKey.currentState!.validate()){
                                                    model.changePhone(newPhone);
                                                    Navigator.of(dialogContext)
                                                        .pop(); // Dismiss alert dialog
                                                  }
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
                            Spacer(),
                            /// RELATION MANAGEMENT
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Mes listes',
                                  style: TextStyle(fontSize: 14, color: Colors.black87)
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /// FLASHNEWS
                                  ListTile(
                                    title: Text('FlashNews',
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                      onTap: () {
                                        /// NAVIGATE TO FLASH NEWS VIEW
                                        model.navigateToFlashNews();
                                      }
                                  ),
                                  Divider(),
                                  /// NEWSPAPER
                                  ListTile(
                                    title: Text('Newspapers',
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                      onTap: () {
                                        /// NAVIGATE TO NEWSPAPER VIEW
                                        model.navigateToNewspapers();
                                      }
                                  ),
                                  Divider(),
                                  /// COMPANIES
                                  ListTile(
                                    title: Text('Publishers',
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                      onTap: () {
                                        /// NAVIGATE TO COMPNIES VIEW
                                        model.navigateToCompanies();
                                      }
                                  ),

                                ],
                              ),
                            ),
                            Spacer()
                          ],
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
