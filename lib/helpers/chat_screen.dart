import 'package:chat_task/bloc/message_bloc.dart';
import 'package:chat_task/helpers/chat_text_field.dart';
import 'package:chat_task/helpers/user_header.dart';
import 'package:chat_task/repository/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/events/user_event.dart';
import '../models/chatMessage_model.dart';
import '../models/user_model.dart';
import 'chat_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key,
      required this.user,
      required this.chatId,
      required this.currentUserId});
  final User user;
  final String chatId;
  final String currentUserId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatRepository chatRepository = ChatRepository();
  void _handleMessageSend(String message) {
    if (message.isNotEmpty) {
      ChatMessage newMessage = ChatMessage(
        senderId: widget.currentUserId,
        recieverId: widget.user.uid,
        text: message,
        time: Timestamp.now(),
        status: true,
      );
      BlocProvider.of<MessageBloc>(context).add(UserEvent.sendMessage(
          widget.chatId, widget.currentUserId, widget.user.uid, newMessage));
    }
  }

  void resetUnreadMessages() async {
    int userIndex = int.parse(widget.currentUserId) - 1;

    await chatRepository.resetUnreadMessageCount(widget.chatId, userIndex);
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<MessageBloc>(context)
        .add(UserEvent.getMessages(widget.chatId, widget.user.uid));
    resetUnreadMessages();
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
                  currentUserId: widget.currentUserId),
              ChatTextFieldWidget(
                hint: "Send Message",
                onChange: _handleMessageSend,
              ),
            ],
          )),
    );
  }
}
