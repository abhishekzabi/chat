import 'package:equatable/equatable.dart';

class PostEntities extends Equatable{
  final String title;
  final String body;
  final int id;
  final int userid;
  PostEntities({
    required this.title, 
    required this.body,
    required this.id,
    required this.userid
  
  });
  
  @override
  List<Object?> get props => [title,body,id,userid];

}