// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Newspaper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Newspaper _$NewspaperFromJson(Map<String, dynamic> json) {
  return Newspaper()
    ..id = json['id'] as String
    ..titles = json['titles'] as String
    ..pdfURL = json['pdfURL'] as String
    ..country = json['country'] as String
    ..price = json['price'].toString()
    ..newsPaperCompany = json['newsPaperCompany'] as String
    ..firstPageURL = json['firstPageURL'] as String
    ..category = json['category'] as String
    ..date = json['date'] as String;
}

Map<String, dynamic> _$NewspaperToJson(Newspaper instance) => <String, dynamic>{
      'id': instance.id,
      'titles': instance.titles,
      'pdfURL': instance.pdfURL,
      'country': instance.country,
      'price': instance.price,
      'newsPaperCompany': instance.newsPaperCompany,
      'firstPageURL': instance.firstPageURL,
      'category': instance.category,
      'date': instance.date,
    };
