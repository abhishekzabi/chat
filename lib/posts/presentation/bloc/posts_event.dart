part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent  extends Equatable{

}
final class PostGeneration extends PostsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
