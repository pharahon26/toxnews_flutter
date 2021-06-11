// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ToxNewsComment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToxNewsComment _$ToxNewsCommentFromJson(Map<String, dynamic> json) {
  return ToxNewsComment()
    ..id = json['id'] as String
    ..sourceId = json['sourceId'] as String
    ..companyId = json['companyId'] as String
    ..userId = json['userId'] as String
    ..text = json['text'] as String
    ..username = json['username'] as String
    ..companyName = json['companyName'] as String
    ..comments =
        (json['comments'] as List<dynamic>).map((e) => e as String).toList()
    ..trends = json['trends'] as int
    ..likes = json['likes'] as int
    ..dislikes = json['dislikes'] as int
    ..watch = json['watch'] as int
    ..level = json['level'] as int;
}

Map<String, dynamic> _$ToxNewsCommentToJson(ToxNewsComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceId': instance.sourceId,
      'companyId': instance.companyId,
      'userId': instance.userId,
      'text': instance.text,
      'username': instance.username,
      'companyName': instance.companyName,
      'comments': instance.comments,
      'trends': instance.trends,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'watch': instance.watch,
      'level': instance.level,
    };
