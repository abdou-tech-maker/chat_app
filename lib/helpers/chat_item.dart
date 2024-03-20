import 'dart:developer';

import 'package:chat_task/repository/chat_repository.dart';
import 'package:chat_task/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/chat_model.dart';
import '../models/user_model.dart';
import 'chat_screen.dart';

class ChatItem extends StatefulWidget {
  final ChatModel chat;
  final String currentUserId;
  const ChatItem({Key? key, required this.chat, required this.currentUserId})
      : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  UserRepository userRepository = UserRepository();
  ChatRepository chatRepository = ChatRepository();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int userIndex = int.parse(widget.currentUserId) - 1;
    int unreadCount = widget.chat.unreadMessagesCount[userIndex];

    return ListTile(
      title: Text(
        widget.chat.title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(timeago.format(widget.chat.lastMessageTime.toDate())),
      trailing: unreadCount > 0
          ? CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text(unreadCount.toString()),
            )
          : const SizedBox(width: 24, height: 24),
      onTap: () async {
        User receiver = await userRepository.getReceiverInfo(
            widget.chat.participants, widget.currentUserId);
        log(receiver.imageUrl);

        if (!mounted) return;

        Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => ChatScreen(
            user: receiver,
            chatId: widget.chat.id,
            currentUserId: widget.currentUserId,
          ),
        ));
      },
    );
  }
}
