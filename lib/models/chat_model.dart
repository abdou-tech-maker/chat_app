import 'package:chat_task/models/chatMessage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final String title;
  final List<String> participants;
  final Timestamp lastMessageTime;
  final List<ChatMessage> messages;
  final List<int> unreadMessagesCount;

  ChatModel(
      {required this.id,
      required this.title,
      required this.participants,
      required this.unreadMessagesCount,
      required this.lastMessageTime,
      required this.messages});
}
