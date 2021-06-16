// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewspaperCompany.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewspaperCompany _$NewspaperCompanyFromJson(Map<String, dynamic> json) {
  return NewspaperCompany()
    ..id = json['id'] as String
    ..logoURL = json['logoURL'] as String
    ..name = json['name'] as String
    ..country = json['country'] as String
    ..city = json['city'] as String
    ..mail = ((json['mail']??[]) as List<dynamic>).map((e) => e as String).toList()
    ..newspapers =
        ((json['newspapers']??[]) as List<dynamic>).map((e) => e as String).toList()
    ..flashNews =
        ((json['flashNews']??[]) as List<dynamic>).map((e) => e as String).toList()
    ..phoneNumber =
        ((json['phoneNumber']??[]) as List<dynamic>).map((e) => e as num).toList()
    ..comments =
        ((json['comments']??[]) as List<dynamic>).map((e) => e as String).toList()
    ..followers = (json['followers']??0) as int
    ..trends = (json['trends']??0) as int
    ..likes = (json['likes']??0) as int
    ..level = (json['level']??0) as int;
}

Map<String, dynamic> _$NewspaperCompanyToJson(NewspaperCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoURL': instance.logoURL,
      'name': instance.name,
      'country': instance.country,
      'city': instance.city,
      'mail': instance.mail,
      'newspapers': instance.newspapers,
      'flashNews': instance.flashNews,
      'phoneNumber': instance.phoneNumber,
      'comments': instance.comments,
      'followers': instance.followers,
      'trends': instance.trends,
      'likes': instance.likes,
      'level': instance.level,
    };
