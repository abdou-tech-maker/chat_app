// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String recieverId;
  final String senderId;
  final String text;
  final Timestamp time;
  final bool status;

  ChatMessage(
      {required this.recieverId,
      required this.senderId,
      required this.text,
      required this.time,
      required this.status});
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      recieverId: json['recieverId'],
      senderId: json['senderId'],
      text: json['text'],
      time: json['time'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recieverId': recieverId,
      'senderrecieverId': senderId,
      'text': text,
      'time': time,
      "status": status,
    };
  }

  ChatMessage copyWith({
    String? recieverId,
    String? senderrecieverId,
    String? text,
    Timestamp? time,
    bool? status,
  }) {
    return ChatMessage(
      recieverId: recieverId ?? this.recieverId,
      senderId: senderrecieverId ?? senderId,
      text: text ?? this.text,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }

  factory ChatMessage.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ChatMessage(
      recieverId: data['recieverId'],
      senderId: data['senderId'],
      status: data['status'],
      text: data['text'],
      time: data['time'],
    );
  }
}
