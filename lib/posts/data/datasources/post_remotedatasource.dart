
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:myapp/posts/data/models/post_model.dart';

abstract class PostRemoteDatasource{
  Future<List<PostModel>>getPostFromApi();


}
class PostRemoteDatasourceImpl implements PostRemoteDatasource{
  final client=http.Client();
  @override
  Future<List<PostModel>> getPostFromApi()async {
    try{
      final response=await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers:{
          'content-type':'application/json'

        }
        
      );
      if(response.statusCode==200){
        
        final List<dynamic>responceBody=jsonDecode(response.body);
        final List<PostModel>posts=responceBody.map((json) => PostModel.fromjson(json)).toList();
        return posts;
      
      }
      else{
        throw Exception("faiure to load post");
      }
    }
    catch(e){
      throw Exception("$e");

    }
   
  }

}