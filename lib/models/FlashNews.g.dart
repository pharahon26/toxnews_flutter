// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlashNews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashNews _$FlashNewsFromJson(Map<String, dynamic> json) {
  return FlashNews()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..news = json['news'] as String
    ..link = json['link'] as String
    ..mediaLink = json['mediaLink'] as String
    ..company = json['company'] as String
    ..category = json['category'] as String
    ..creationDate = json['creationDate'] as int;
}

Map<String, dynamic> _$FlashNewsToJson(FlashNews instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'news': instance.news,
      'link': instance.link,
      'mediaLink': instance.mediaLink,
      'company': instance.company,
      'category': instance.category,
      'creationDate': instance.creationDate,
    };
