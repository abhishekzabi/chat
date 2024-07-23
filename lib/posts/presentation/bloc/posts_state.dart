part of 'posts_bloc.dart';

@immutable
sealed class PostsState extends Equatable {}

final class PostsInitial extends PostsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class PostLoading extends PostsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class PostLoaded extends PostsState {
  final List<PostEntities> posts;
  PostLoaded({required this.posts});

  @override
  List<Object?> get props => [];
}

final class PostFailure extends PostsState {
  final String message;

  PostFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
