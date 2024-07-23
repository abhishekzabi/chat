// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:myapp/posts/domain/entities/post_entities.dart';
// import 'package:myapp/posts/domain/usecases/post_usecases.dart';


// part 'posts_event.dart';
// part 'posts_state.dart';

// class PostsBloc extends Bloc<PostsEvent, PostsState> {
//   PostsBloc() : super(PostsInitial()) {
//     on<PostGeneration>((event, emit) async{
//       try{
//         final posts=PostUsecases().getPostfromDataSources();
//         emit(PostLoaded(posts: posts));
//       }
//       catch(e){
//         emit(PostFailure(message: e.toString()));
//       }


     
      
//     });
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myapp/posts/domain/entities/post_entities.dart';
import 'package:myapp/posts/domain/usecases/post_usecases.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostUsecases postUsecases; // Inject PostUsecases via constructor

  PostsBloc(this.postUsecases) : super(PostsInitial()) {
    on<PostGeneration>((event, emit) async {
      try {
        final posts = await getPosts(); // Await the result of getPosts()
        emit(PostLoaded(posts: posts));
      } catch (e) {
        emit(PostFailure(message: e.toString()));
      }
    });
  }

  Future<List<PostEntities>> getPosts() async {
    return await postUsecases.getPostfromDataSources();
  }
}
