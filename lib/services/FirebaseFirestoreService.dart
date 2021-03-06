import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/models/NewspaperCompany.dart';
import 'package:toxnews/models/ToxNewsUsers.dart';

class FirebaseFirestoreService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference? _user_collection;
  Query? _flash_news_collection;
  Query? _newspaper_collection;
  ToxNewsUsers _toxNewsUser = ToxNewsUsers();
  ToxNewsUsers get user => _toxNewsUser;

  FirebaseFirestoreService(){
    _user_collection = _firestore.collection(ToxNewsUsers.REF_FIREBASE_FIRESTORE);
    _flash_news_collection = _firestore.collectionGroup(FlashNews.REF_FIREBASE_FIRESTORE);
    _newspaper_collection = _firestore.collectionGroup(Newspaper.REF_FIREBASE_FIRESTORE);
  }

  /// User Data Interactions
  /// Create User data
  Future createUserData(ToxNewsUsers users) async {
    // a supp
    if (_user_collection != null){
      return await _user_collection!.doc(users.id).set(users.toJson()).catchError((error) => print("Failed to add user: $error"));
    }
  }

  /// Get User data
  Future getUserData(String id) async {
    _user_collection!.doc(id).snapshots().listen((event) {
      _toxNewsUser = ToxNewsUsers.fromJson(event.data()!);
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
      return await _user_collection!.doc(users.id).update(users.toJson()).catchError((error) => print("Failed to add user: $error"));
    }
  }

  /// COMPANY
  /// get company
  Future<NewspaperCompany> getCompany(String companyId) async{
    /// get the Newspaper from a specific company
    NewspaperCompany c = NewspaperCompany();
    DocumentReference companyNewspaperRef = _firestore.collection(NewspaperCompany.REF_FIREBASE_FIRESTORE).doc(companyId);
    return companyNewspaperRef.get().then((value) => NewspaperCompany.fromJson(value.data()!));
  }


  /// FLASHNEWS
  /// FlashNews interactions
  Future<List<FlashNews>> getFlashNews() async {
    /// get all flashNews
    List<FlashNews> result = [];
    await _flash_news_collection!.get().then((value) {
      print('FIRESTORE SERVICE: Get news');
      value.docs.forEach((element) {
        print('FIRESTORE SERVICE: FlashNews before ${element.data()!['id']} ${element.data()!['title']} ${element.data()!['news']} ${element.data()!['link']} ${element.data()!['company']} ${element.data()!['category']} ${element.data()!['creationDate']} ');
        FlashNews news = FlashNews.fromJson(element.data()!);
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
    return _flash_news_collection!.snapshots().map((event) => _flashNewsListFromSnapshot(event));
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
      List<FlashNews> result = [];
      event.docs.forEach((element) {
        result.add(FlashNews.fromJson(element.data()!));
      });
      return result;
  }


  /// NEWSPAPER
  /// Newspaper interactions
  Future<List<Newspaper>> getNewspaper() async {
    /// get all flashNews
    List<Newspaper> result = [];
    await _newspaper_collection!.get().then((value) {
      print('FIRESTORE SERVICE: Get newspaper');

      value.docs.forEach((element) {
        print('FIRESTORE SERVICE: newspaper before ${element.data()!['id']} ${element.data()!['title']} ${element.data()!['news']} ${element.data()!['link']} ${element.data()!['company']} ${element.data()!['category']} ${element.data()!['creationDate']} ');
        Newspaper news = Newspaper.fromJson(element.data()!);
        print('FIRESTORE SERVICE: newspaper ${news.id} ${news.titles} ${news.pdfURL} ${news.newsPaperCompany} ${news.newsPaperCompany} ${news.category} ${news.date} ');
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
      print('FIRESTORE SERVICE: newspaper ${news.id} ${news.titles} ${news.pdfURL} ${news.newsPaperCompany} ${news.newsPaperCompany} ${news.category} ${news.date} ');
    });
    return result;
  }

  Future<Stream<List<Newspaper>>> listenToNewspapers() async{
    return _newspaper_collection!.snapshots().map((event) => _newspaperListFromSnapshot(event));
  }

  /// FlashNews by company
  Future<List<Newspaper>> getCompanynewspapers(String company) async {
    /// get the Newspaper from a specific company
    CollectionReference companyNewspaperRef = _firestore.collection(NewspaperCompany.REF_FIREBASE_FIRESTORE).doc(company).collection(Newspaper.REF_FIREBASE_FIRESTORE);
    return _newspaperListFromSnapshot(await companyNewspaperRef.get());
  }


  Future<Stream<List<Newspaper>>> listenToCompanyNewspaper(String company) async {
    /// get the stream Newspaper from a specific company
    CollectionReference companyNewspaperRef = _firestore.collection(NewspaperCompany.REF_FIREBASE_FIRESTORE).doc(company).collection(Newspaper.REF_FIREBASE_FIRESTORE);
    return companyNewspaperRef.snapshots().map((event) => _newspaperListFromSnapshot(event));
  }

  List<Newspaper> _newspaperListFromSnapshot(QuerySnapshot event){
      List<Newspaper> result = [];
      event.docs.forEach((element) {
        result.add(Newspaper.fromJson(element.data()!));
      });
      return result;
  }



}