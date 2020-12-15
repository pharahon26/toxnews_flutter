import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/models/NewspaperCompany.dart';
import 'package:toxnews/models/ToxNewsUsers.dart';

@lazySingleton
class FirebaseFirestoreService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _user_collection;
  Query _flash_news_collection;
  ToxNewsUsers _toxNewsUser;
  List<FlashNews> _flashNews = List();

  FirebaseFirestoreService(){
    _user_collection = _firestore.collection(ToxNewsUsers.REF_FIREBASE_FIRESTORE);
    _flash_news_collection = _firestore.collectionGroup(FlashNews.REF_FIREBASE_FIRESTORE);
  }

  /// User Data Interactions
  /// Create User data
  Future createUserData(ToxNewsUsers users) async {
    // a supp
    if (_user_collection != null){
      await _user_collection.doc(users.id).set(users.toJson()).catchError((error) => print("Failed to add user: $error"));
    }
  }

  /// Get User data
  Future getUserData(String id) async {
    _user_collection.doc(id).snapshots().listen((event) {
      _toxNewsUser = ToxNewsUsers.fromJson(event.data());
      print(
        '''
        FIRESTORE SERVICE: !! Get User Data NAME: ${_toxNewsUser.name} MAIL: ${_toxNewsUser.mail}}
        '''
      );
    });
    return _toxNewsUser;
  }

  /// update User data
  Future updateUserData(ToxNewsUsers users) async {
    if (_user_collection != null){
      await _user_collection.doc(users.id).update(users.toJson()).catchError((error) => print("Failed to add user: $error"));
    }
  }

  /// FlashNews interactions
  Future<List<FlashNews>> getFlashNews() async {
    /// get all flashNews
    List<FlashNews> result = List();
    await _flash_news_collection.get().then((value) {
      print('FIRESTORE SERVICE: Get news');
      value.docs.forEach((element) {
        print('FIRESTORE SERVICE: FlashNews before ${element.data()['id']} ${element.data()['title']} ${element.data()['news']} ${element.data()['link']} ${element.data()['company']} ${element.data()['category']} ${element.data()['creationDate']} ');
        FlashNews news = FlashNews.fromJson(element.data());
        print('FIRESTORE SERVICE: FlashNews ${news.id} ${news.title} ${news.news} ${news.link} ${news.company} ${news.category} ${news.creationDate} ');
        result.add(news);
        print('FIRESTORE SERVICE: Get news done!');
      });
    });
    // FlashNews t1 = FlashNews.build(
    //     DateTime.now().toIso8601String(),
    //     'A big News',
    //     'Toxnews is comming are you ready for the Storm,',
    //     '_link',
    //     '_mediaLink',
    //     'Coco.Ivoire',
    //     DateTime.now().millisecondsSinceEpoch);
    //
    // FlashNews t2 = FlashNews.build(
    //     DateTime.now().toIso8601String(),
    //     'A second big News',
    //     ' Let keep the energy and get the job done',
    //     '_link',
    //     '_mediaLink',
    //     'Pyra.Burkina',
    //     DateTime.now().millisecondsSinceEpoch);

    // result.add(t1);
    // result.add(t2);
    result.forEach((news) {
      print('FIRESTORE SERVICE: FlashNews LIST: ${news.id} ${news.title} ${news.news} ${news.link} ${news.company} ${news.category} ${DateTime.fromMillisecondsSinceEpoch(news.creationDate)} ');
    });
    return result;
  }

  Future<Stream<List<FlashNews>>> listenToFlashNews() async{
    return _flash_news_collection.snapshots().map((event) => _flashNewsListFromSnapshot(event));
  }

  /// FlashNews by company
  Future<List<FlashNews>> getCompanyFlashNews(String company) async {
    /// get the flashNews from a specific company
    CollectionReference companyFlashNewsRef = _firestore.collection(NewspaperCompany.REF_FIREBASE_FIRESTORE).doc(company).collection(FlashNews.REF_FIREBASE_FIRESTORE);
    return _flashNewsListFromSnapshot(await companyFlashNewsRef.get());
  }

  Future<Stream<List<FlashNews>>> listenToCompanyFlashNews(String company) async {
    /// get the stream flashNews from a specific company
    CollectionReference companyFlashNewsRef = _firestore.collection(NewspaperCompany.REF_FIREBASE_FIRESTORE).doc(company).collection(FlashNews.REF_FIREBASE_FIRESTORE);
    return companyFlashNewsRef.snapshots().map((event) => _flashNewsListFromSnapshot(event));
  }

  List<FlashNews> _flashNewsListFromSnapshot(QuerySnapshot event){
      List<FlashNews> result = List();
      event.docs.forEach((element) {
        result.add(FlashNews.fromJson(element.data()));
      });
      return result;
  }
}