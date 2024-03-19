// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String id;
  final String senderId;
  final String text;
  final Timestamp time;
  final bool isMe;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.text,
    required this.time,
    this.isMe = false,
  });
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      text: json['text'],
      time: json['time'],
      isMe: json['isMe'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'text': text,
      'time': time,
      'isMe': isMe,
    };
  }
}
