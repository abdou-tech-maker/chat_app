import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/chatMessage_model.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message, required this.isMe});
  final ChatMessage message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: message.isMe
                ? Colors.grey.shade300
                : const Color.fromARGB(255, 80, 102, 167),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: message.isMe
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
              bottomRight: message.isMe
                  ? const Radius.circular(0)
                  : const Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isMe ? Colors.black : Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            timeago.format(message.time.toDate()),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
