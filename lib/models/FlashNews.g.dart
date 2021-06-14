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
    ..companyLogoURL = json['companyLogoURL'] as String
    ..category = json['category'] as String
    ..creationDate = json['creationDate'] as int
    ..likes = json['likes']?? 0
    ..unlikes = json['unlikes']?? 0
    ..trends = json['trends']?? 0
    ..watcher = json['watcher']?? 0
    ..comments =
        (json['comments'] as List<dynamic>).map((e) => e as String).toList()
    ..level = 0;
}

Map<String, dynamic> _$FlashNewsToJson(FlashNews instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'news': instance.news,
      'link': instance.link,
      'mediaLink': instance.mediaLink,
      'company': instance.company,
      'companyLogoURL': instance.companyLogoURL,
      'category': instance.category,
      'creationDate': instance.creationDate,
      'likes': instance.likes,
      'unlikes': instance.unlikes,
      'trends': instance.trends,
      'watcher': instance.watcher,
      'comments': instance.comments,
      'level': instance.level,
    };
