import 'package:myapp/posts/domain/entities/post_entities.dart';

class PostModel extends PostEntities {
  PostModel({
    required super.title,
    required super.body,
    required super.id,
    required super.userid,
  });

  factory PostModel.fromjson(Map<String,dynamic>json){
    return PostModel(
      title: json['title'],
    
     body:json['body'],
      id: json['id'],
       userid: json['userId'],);
  }



}
