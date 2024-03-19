import 'package:flutter/material.dart';

import '../constantes/constantes.dart';
import 'message_bubble.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.recieverId});
  final String recieverId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dummyChatMessages.length,
        itemBuilder: (context, index) {
          final message = dummyChatMessages[index];
          final isMe = recieverId != dummyChatMessages[index].senderId;
          return MessageBubble(
            message: message,
            isMe: isMe,
          );
        },
      ),
    );
  }
}
