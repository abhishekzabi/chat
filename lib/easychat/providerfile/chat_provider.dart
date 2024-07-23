import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getChats(String userId) {
    return _firestore
        .collection("chats")
        .where("users", arrayContains: userId)
        .snapshots();
  }

  Stream<QuerySnapshot> searchUsers(String query) {
    return _firestore
        .collection("users")
        .where('email', isLessThanOrEqualTo: query)
        .where('email', isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots();
  }

  Future<void> sendMessage(
      String chatId, String message, String recieverId) async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection("messages")
          .add({
        'senderId': currentUser.uid,
        'recieverId': recieverId,
        'messageBody': message,
        'timestamp': FieldValue.serverTimestamp(),
      });
      await _firestore.collection('chats').doc(chatId).set({
        'users': [currentUser.uid, recieverId],
        'lastMessage': message,
        'timestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

  Future<String?> getChatRoom(String recieverId) async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final chatQuery = await _firestore
          .collection('chats')
          .where('users', arrayContains: currentUser.uid)
          .get();

      final chats = chatQuery.docs
          .where((chat) => ['users'].contains(recieverId))
          .toList();
      if (chats.isNotEmpty) {
        return chats.first.id;
      }
    }
    return null;
  }
  Future<String>createChatRoom(String recieverId)async{
    final currentUser=_auth.currentUser;
    if(currentUser !=null){
      final chatRoom=await _firestore.collection('chats').add({
        'users':[currentUser.uid,recieverId],
        'lastMessage':'',
        'timestamp':FieldValue.serverTimestamp(),
      });
    }
    throw Exception('No Current User');
  }
}
