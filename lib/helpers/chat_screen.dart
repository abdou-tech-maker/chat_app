import 'dart:developer';

import 'package:chat_task/helpers/chat_text_field.dart';
import 'package:chat_task/helpers/user_header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constantes/constantes.dart';
import '../models/chatMessage_model.dart';
import '../models/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user, required this.chatId});
  final User user;
  final String chatId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _handleMessageSend(String message) {
    dummyChatMessages.add(ChatMessage(
      recieverId: "6",
      senderId: "user_2",
      text: message,
      time: Timestamp.fromDate(DateTime.now()),
      isMe: true,
      status: true,
    ));
    log("Message to send: $message");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserHeader(
        user: widget.user,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          child: Column(
            children: [
              MessageList(recieverId: widget.user.uid),
              ChatTextFieldWidget(
                hint: "Send Message",
                onChange: _handleMessageSend,
              ),
            ],
          )),
    );
  }
}
