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
    ..mail = (json['mail'] as List<dynamic>).map((e) => e as String).toList()
    ..newspapers =
        (json['newspapers'] as List<dynamic>).map((e) => e as String).toList()
    ..phoneNumber =
        (json['phoneNumber'] as List<dynamic>).map((e) => e as num).toList();
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
      'phoneNumber': instance.phoneNumber,
    };
