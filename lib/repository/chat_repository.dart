import 'dart:developer';

import 'package:chat_task/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chatMessage_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream<List<ChatMessage>> getMessages(String chatId, String currentUserId) {
  //   return _firestore
  //       .collection('chats')
  //       .doc(chatId)
  //       .collection('messages')
  //       .orderBy('time', descending: true)
  //       .snapshots(includeMetadataChanges: true)
  //       .map((snapshot) => snapshot.docs.map((doc) {
  //             var data = doc.data();
  //             return ChatMessage(
  //               recieverId: data['recieverId'],
  //               senderId: data['senderId'],
  //               status: data['status'],
  //               text: data['text'],
  //               time: data['time'],
  //               isMe: data['isMe'],
  //             );
  //           }).toList());
  // }

  Stream<List<ChatMessage>> getMessages(String chatId, String currentUserId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return ChatMessage.fromFirestore(doc);
            }).toList())
        .handleError((error) {
      log("Error fetching messages: $error");
      return [];
    });
  }

  Stream<List<ChatModel>> getUserChatList(String currentUserId) {
    return _firestore
        .collection('chats')
        .where('participants', arrayContains: currentUserId)
        .orderBy('lastMessageTime', descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs.map((doc) {
              var data = doc.data();
              return ChatModel(
                id: doc.id,
                title: data['title'],
                lastMessageTime: data['lastMessageTime'],
                messages: [],
                unreadMessagesCount: data['unReadMessageCount'] as int? ?? 0,
                participants: List<String>.from(data['participants']),
              );
            }).toList());
  }

  Future<void> sendMessage(String chatId, ChatMessage message) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toJson());
  }
}
