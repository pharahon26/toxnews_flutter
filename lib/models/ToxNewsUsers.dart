/// The User class that represent the user data

class ToxNewsUsers{

  // variables
  String _id;
  String get id => _id;
  set id(String value) {
    _id = value;
  }

  String _mail;
  String get mail => _mail;
  set mail(String value) {
    _mail = value;
  }

  String _name;
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String _number;
  String get number => _number;
  set number(String value) {
    _number = value;
  }

  bool _subscriber;
  bool get subscriber => _subscriber;
  set subscriber(bool value) {
    _subscriber = value;
  }

  List<String> _newsPaperOwned = List();
  List<String> get newsPaperOwned => _newsPaperOwned;
  set newsPaperOwned(List<String> value) {
    _newsPaperOwned = value;
  }

  List<String> _newsPaperSubscribed = List();
  List<String> get newsPaperSubscribed => _newsPaperSubscribed;
  set newsPaperSubscribed(List<String> value) {
    _newsPaperSubscribed = value;
  }

  List<String> _favoriteCompanies = List();
  List<String> get favoriteCompanies => _favoriteCompanies;
  set favoriteCompanies(List<String> value) {
    _favoriteCompanies = value;
  }

  List<String> _favoriteCategories = List();
  List<String> get favoriteCategories => _favoriteCategories;
  set favoriteCategories(List<String> value) {
    _favoriteCategories = value;
  }

  //firebase firestore reference
  final String REF_FIREBASE_FIRESTORE = 'Users';

  ToxNewsUsers();

  ToxNewsUsers.builder(this._id, this._name, this._mail, this._number);

}