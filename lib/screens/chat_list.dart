import 'dart:developer';

import 'package:chat_task/bloc/chat_bloc.dart';
import 'package:chat_task/bloc/states/chat_states.dart';
import 'package:chat_task/helpers/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/events/user_event.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key, required this.currentUserId});
  final String currentUserId;
  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatBloc>(context)
        .add(UserEvent.chatList(widget.currentUserId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChatLoaded) {
              final chats = state.chats;

              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                physics: const BouncingScrollPhysics(),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  log(chat.unreadMessagesCount.toString());
                  return ChatItem(
                    chat: chat,
                    currentUserId: widget.currentUserId,
                  );
                },
              );
            } else if (state is ChatLoadFailure) {
              return const Center(child: Text('Failed to load Chat.'));
            } else {
              return const Center(child: Text('Unknown state.'));
            }
          },
        ));
  }
}
