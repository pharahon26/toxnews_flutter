import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toxnews/models/Newspaper.dart';

class NewspaperRepository{

  Directory? directory;
  String? path;

  NewspaperRepository(){
    init();
  }

   void init() async{
     directory = await getApplicationDocumentsDirectory();
     print('directory path ${directory!.path}');
     path = directory!.path;

   }

  Future<String> downloadNewspaper(Newspaper newspaper) async{
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '$path/${newspaper.id}';
    try {
      var request = await httpClient.getUrl(Uri.parse(newspaper.pdfURL));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        file = File(filePath);
        await file.writeAsBytes(bytes);
      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return filePath;
  }

  savePdf(File pdf) async {

  }

  getStoredNewspaper(String newspaperId){

  }

  // Future<File> get _localFile async {
  //   // return File('$path/counter.txt');
  // }


}