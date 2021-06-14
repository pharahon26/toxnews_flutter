import 'package:json_annotation/json_annotation.dart';
import 'package:toxnews/app/Relation_manager.dart';
import 'package:toxnews/models/app_enums.dart';
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
  /// ROOF
  final int roof = 2^CommentState.values.length;

  //firebase firestore reference
  static const String REF_FIREBASE_FIRESTORE = 'Comments';

  ToxNewsComment();

  /// COMMENT **STATE** {onw, like, trend, comment, watch}

  bool isCommented() => RelationManager.decodeLevel(level, roof~/2, CommentState.comment.index);
  void comment() {
    if(isCommented()){
      level-=roof~/(2*2^CommentState.comment.index);
    } else{
      level+=roof~/(2*2^CommentState.comment.index);
    }
  }

  bool isLiked() => RelationManager.decodeLevel(level, roof~/2, CommentState.like.index);
  void like() {
    if(isLiked()){
      level-=roof~/(2*2^CommentState.like.index);
    } else{
      level+=roof~/(2*2^CommentState.like.index);
    }
  }
  bool hadTrend() => RelationManager.decodeLevel(level, roof~/2, CommentState.trend.index);
  void trend() {
    if(!hadTrend()){
      level+=roof~/(2*2^CommentState.trend.index);
    }
  }
  bool isWatching() => RelationManager.decodeLevel(level, roof~/2, CommentState.watch.index);
  void pushWatch() {
    if(isWatching()){
      level-=roof~/(2*2^CommentState.watch.index);
    } else{
      level+=roof~/(2*2^CommentState.watch.index);
    }
  }


  ToxNewsComment.builder(this.id, this.userId, this.sourceId, this.companyId,  this.username,  this.companyName,  this.text ){
    /// create a new COMMENT
  }

  Map<String, dynamic> toJson() => _$ToxNewsCommentToJson(this);

  /// create user from map data usually from firebase
  factory ToxNewsComment.fromJson(Map<String, dynamic> json) => _$ToxNewsCommentFromJson(json);

}