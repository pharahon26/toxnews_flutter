/// The User class that represent the user data

class ToxNewsUsers{

  // variables
  // ID
  String _id;
  String get id => _id;
  set id(String value) {
    _id = value;
  }
  //MAIL
  String _mail;
  String get mail => _mail;
  set mail(String value) {
    _mail = value;
  }
  //NAME
  String _name;
  String get name => _name;
  set name(String value) {
    _name = value;
  }
  // NUMBER
  String _number;
  String get number => _number;
  set number(String value) {
    _number = value;
  }
  // IS SUBSCRIBER
  bool _subscriber;
  bool get subscriber => _subscriber;
  set subscriber(bool value) {
    _subscriber = value;
  }
  /// NEWSPAPER
  // OWN
  List<String> _newsPaperOwned = List();
  List<String> get newsPaperOwned => _newsPaperOwned;
  set newsPaperOwned(List<String> value) {
    _newsPaperOwned = value;
  }
  // SUBSCRIBE
  List<String> _newsPaperSubscribed = List();
  List<String> get newsPaperSubscribed => _newsPaperSubscribed;
  set newsPaperSubscribed(List<String> value) {
    _newsPaperSubscribed = value;
  }
  /// FAVORITE
  // COMPANY
  List<String> _favoriteCompanies = List();
  List<String> get favoriteCompanies => _favoriteCompanies;
  set favoriteCompanies(List<String> value) {
    _favoriteCompanies = value;
  }
  // CATEGORY
  List<String> _favoriteCategories = List();
  List<String> get favoriteCategories => _favoriteCategories;
  set favoriteCategories(List<String> value) {
    _favoriteCategories = value;
  }

  //firebase firestore reference
  static final String REF_FIREBASE_FIRESTORE = 'Users';

  ToxNewsUsers();

  ToxNewsUsers.builder(this._id, this._name, this._mail, this._number){
    /// create a new user Object with subscriber = false, that means that
    /// a user create in the app is consider as if he is not related to a company
    _subscriber = false;
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : _id,
      'mail' : _mail,
      'name' : name,
      'number' : _number,
      'favoriteCategories' : _favoriteCategories,
      'favoriteCompanies' : _favoriteCompanies,
      'newsPaperOwned' : _newsPaperOwned,
      'newsPaperSubscribed' : _newsPaperSubscribed,
      'subscriber' : _subscriber,
    };
  }

   ToxNewsUsers.fromMap(Map<String, dynamic> data){
      /// create user from map data usually from firebase
       _id = data['id'];
      _mail = data['mail'];
      _name = data['name'];
      _number = data['number'];
      // _favoriteCategories = data['favoriteCategories'];
      // _favoriteCompanies = data['favoriteCompanies'] as List<String>;
      // _newsPaperOwned = data['newsPaperOwned'] as List<String>;
      // _newsPaperSubscribed = data['newsPaperSubscribed'] as List<String>;
      _subscriber = data['subscriber'];
  }


}