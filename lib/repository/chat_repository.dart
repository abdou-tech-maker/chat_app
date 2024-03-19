import 'package:chat_task/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chatMessage_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatMessage>> getChat(String chatId, String currentUserId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs.map((doc) {
              var data = doc.data();
              return ChatMessage(
                recieverId: data['recieverId'],
                senderId: data['senderId'],
                text: data['text'],
                time: data['time'],
                isMe: data['isMe'] == currentUserId,
                status: data['status'],
              );
            }).toList());
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
                title: data['title'],
                lastMessageTime: data['lastMessageTime'],
                messages: [],
                unreadMessagesCount: data['unReadMessageCount'],
                participants: data['participants'],
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
