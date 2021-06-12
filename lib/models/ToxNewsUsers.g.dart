// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ToxNewsUsers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToxNewsUsers _$ToxNewsUsersFromJson(Map<String, dynamic> json) {
  return ToxNewsUsers()
    ..id = json['id'] as String
    ..mail = json['mail'] as String
    ..name = json['name'] as String
    ..number = json['number'] as String
    ..image = json['image'] as String
    ..subscriber = json['subscriber'] as bool
    ..newspapers = Map<String, int>.from(json['newspapers'] as Map)
    ..flashNews = Map<String, int>.from(json['flashNews'] as Map)
    ..companies = Map<String, int>.from(json['companies'] as Map)
    ..comments = Map<String, int>.from(json['comments'] as Map)
    ..favoriteCategories = (json['favoriteCategories'] as List<dynamic>)
        .map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$ToxNewsUsersToJson(ToxNewsUsers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mail': instance.mail,
      'name': instance.name,
      'number': instance.number,
      'image': instance.image,
      'subscriber': instance.subscriber,
      'newspapers': instance.newspapers,
      'flashNews': instance.flashNews,
      'companies': instance.companies,
      'comments': instance.comments,
      'favoriteCategories': instance.favoriteCategories,
    };
