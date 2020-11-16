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
    ..subscriber = json['subscriber'] as bool
    ..newsPaperOwned =
        (json['newsPaperOwned'] as List)?.map((e) => e as String)?.toList()
    ..newsPaperSubscribed =
        (json['newsPaperSubscribed'] as List)?.map((e) => e as String)?.toList()
    ..favoriteCompanies =
        (json['favoriteCompanies'] as List)?.map((e) => e as String)?.toList()
    ..favoriteCategories =
        (json['favoriteCategories'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ToxNewsUsersToJson(ToxNewsUsers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mail': instance.mail,
      'name': instance.name,
      'number': instance.number,
      'subscriber': instance.subscriber,
      'newsPaperOwned': instance.newsPaperOwned,
      'newsPaperSubscribed': instance.newsPaperSubscribed,
      'favoriteCompanies': instance.favoriteCompanies,
      'favoriteCategories': instance.favoriteCategories,
    };
