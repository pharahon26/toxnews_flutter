import 'package:json_annotation/json_annotation.dart';
part 'ToxNewsComment.g.dart';
@JsonSerializable()
class ToxNewsComment{
  /// ID
  String id = '';
  /// SOURCE ID : CAN BE flashNews, newspapers, comment...
  String sourceId = '';
  /// COMPANY ID
  String companyId = '';
  /// USER ID
  String userId = '';
  /// TEXT
  String text = '';
  /// USERNAME
  String username = '';
  /// COMPANY NAME
  String companyName = '';
  /// COMMENTS
  List<String> comments = [];
  /// TRENDS
  int trends = 0;
  /// LIKES
  int likes = 0;
  /// DISLIKES
  int dislikes = 0;
  /// WATCH
  int watch = 0;
  /// LEVEL
  int level = 0;

  //firebase firestore reference
  static const String REF_FIREBASE_FIRESTORE = 'Comments';

  ToxNewsComment();

  ToxNewsComment.builder(this.id, this.userId, this.sourceId, this.companyId,  this.username,  this.companyName,  this.text ){
    /// create a new COMMENT
  }

  Map<String, dynamic> toJson() => _$ToxNewsCommentToJson(this);

  /// create user from map data usually from firebase
  factory ToxNewsComment.fromJson(Map<String, dynamic> json) => _$ToxNewsCommentFromJson(json);

}