import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/posts/domain/usecases/post_usecases.dart';
import 'package:myapp/posts/presentation/bloc/posts_bloc.dart';
import 'package:myapp/posts/presentation/widgets/buffer.dart';
import 'package:myapp/posts/presentation/widgets/error_message.dart';

class PostWrapper extends StatelessWidget {
  final postUsecases = PostUsecases();
   PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(postUsecases),
      child: QuatesHome()
    );
  }
}

class QuatesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: const Text(
              "FIND QUATES",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(onPressed: (){
                BlocProvider.of<PostsBloc>(context).add(PostGeneration());

              },
               icon: const Icon(Icons.refresh)),
            ],

          ),
          body: Column(
            children: [
              const SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "all posts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )),
              
              BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                 if(state is PostsInitial){
                  return Text("you post are waiting for you");

                 }else if(state is PostLoading){
                  return const Buffer();
                 }else if(state is PostLoaded){
                  return Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: ListView.separated(
                    
                      itemBuilder: (context, index) {
                        
                        return Card(
                          child: 
                        ListTile(
                          leading: CircleAvatar(
                            
                            backgroundColor: Colors.greenAccent,
                            child: Text("$index"),
                          ),
                          title: Text("${state.posts[index].title}"),
                          subtitle: Text("${state.posts[index].body}"),)
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount:state.posts.length
                ),)
              );
                 }
                 else if(state is PostFailure){
                  return ErrorMessage(errormessage: "something went wrong");

                 }
                 else{
                  return Text("error occured");
                 }
                 
                },
                
              )
              
            ],
          )),
    );
  }
}
