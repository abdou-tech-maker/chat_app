import 'dart:developer';

import 'package:chat_task/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chatMessage_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatMessage>> getMessages(String chatId, String currentUserId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time', descending: false)
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

  Future<void> sendMessage(
      {required String chatId,
      required ChatMessage message,
      required String recieverId,
      required String senderId}) async {
    final messageCollection =
        _firestore.collection('chats').doc(chatId).collection('messages');
    final chatDocument = _firestore.collection('chats').doc(chatId);
    bool isMe = message.senderId == senderId;
    await messageCollection.add({
      'senderId': senderId,
      'recieverId': recieverId,
      'text': message.text,
      'time': Timestamp.now(),
      'isMe': isMe,
      'status': false
    });

    await chatDocument.update({
      'lastMessageTime': Timestamp.now(),
    });
  }

  Future<void> createNewChat(List<String> participantIds, String title) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('chats').add({
      'participants': participantIds,
      'title': title,
      'lastMessageTime': Timestamp.now(),
      'unreadMessageCount': 0,
    });
  }
}
