import 'package:myapp/posts/domain/entities/post_entities.dart';

abstract class PostRepositories{
  Future<List<PostEntities>>getPostfromDataSources();
}