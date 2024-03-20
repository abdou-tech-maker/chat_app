import 'package:chat_task/bloc/message_bloc.dart';
import 'package:chat_task/bloc/states/message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_bubble.dart';

class MessageList extends StatefulWidget {
  const MessageList(
      {super.key, required this.recieverId, required this.chatId});
  final String recieverId;
  final String chatId;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        if (state is MessageLoading) {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        } else if (state is MessageLoaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                final message = state.messages[index];
                final isMe = widget.recieverId != message.senderId;

                return MessageBubble(
                  message: message,
                  isMe: isMe,
                );
                // Build and return a widget for each ChatMessage
              },
            ),
          );
        } else if (state is MessageLoadFailure) {
          return const Center(child: Text('Failed to load chat messages.'));
        } else {
          return Container(); // An empty container for uninitialized state
        }
      },
    );
  }
}
