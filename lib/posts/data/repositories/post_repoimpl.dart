import 'package:myapp/posts/data/datasources/post_remotedatasource.dart';
import 'package:myapp/posts/domain/entities/post_entities.dart';
import 'package:myapp/posts/domain/repositories/post_repositories.dart';

class PostRepositoryImpl implements PostRepositories{
  PostRemoteDatasource postRemoteDatasource=PostRemoteDatasourceImpl();
  @override
  Future<List<PostEntities>> getPostfromDataSources()async {
    final posts=await postRemoteDatasource.getPostFromApi();
    return posts;
    
  }
  
}