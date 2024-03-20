import 'dart:developer';

import 'package:chat_task/bloc/message_bloc.dart';
import 'package:chat_task/helpers/chat_text_field.dart';
import 'package:chat_task/helpers/user_header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/events/user_event.dart';
import '../constantes/constantes.dart';
import '../models/chatMessage_model.dart';
import '../models/user_model.dart';
import 'chat_messages.dart';

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
  void initState() {
    super.initState();
    BlocProvider.of<MessageBloc>(context)
        .add(UserEvent.getMessages(widget.chatId, widget.user.uid));
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
              MessageList(
                recieverId: widget.user.uid,
                chatId: widget.chatId,
              ),
              ChatTextFieldWidget(
                hint: "Send Message",
                onChange: _handleMessageSend,
              ),
            ],
          )),
    );
  }
}
