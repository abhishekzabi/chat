import 'package:myapp/posts/data/repositories/post_repoimpl.dart';
import 'package:myapp/posts/domain/entities/post_entities.dart';
import 'package:myapp/posts/domain/repositories/post_repositories.dart';


class PostUsecases{
  PostRepositories postRepositories=PostRepositoryImpl();
  Future <List<PostEntities>>getPostfromDataSources() async{
    final posts=await postRepositories.getPostfromDataSources();
    return posts;
   

  }
}