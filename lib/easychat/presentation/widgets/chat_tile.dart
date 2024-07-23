import 'dart:math';

import 'package:chatapp/easychat/presentation/pages/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String chatId;
  final String lastMessage;
  final DateTime timestamp;
  final Map<String, dynamic> receivereData;

  const ChatTile({
    super.key,
    required this.chatId,
    required this.lastMessage,
    required this.timestamp,
    required this.receivereData,
  });

  @override
  Widget build(BuildContext context) {
    return lastMessage !=""?
    ListTile(
      leading: CircleAvatar(backgroundColor: Colors.greenAccent,),
      title: Text(
        receivereData['name'],

      ),
      subtitle: Text(
        lastMessage,maxLines:2,
      ),
      trailing: Text(
        '${timestamp.hour}:${timestamp.minute}',
        style: TextStyle(
          fontSize: 12,color: Colors.grey
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: 
        (context)=>ChatScreen(chatId: chatId, recieverId:receivereData['uid'])));
      },
    )
    :Container();
  }
}
