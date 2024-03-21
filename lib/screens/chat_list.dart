import 'dart:developer';

import 'package:chat_task/bloc/chat_bloc.dart';
import 'package:chat_task/bloc/states/chat_states.dart';
import 'package:chat_task/helpers/chat_item.dart';
import 'package:chat_task/repository/chat_repository.dart';
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
  ChatRepository chatRepository = ChatRepository();
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
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                String chatTitle = "";

                return AlertDialog(
                  title: const Text("Create New Chat"),
                  content: TextField(
                    onChanged: (value) {
                      chatTitle = value;
                    },
                    decoration:
                        const InputDecoration(hintText: "Enter Chat Title"),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text("Create"),
                      onPressed: () {
                        if (chatTitle.isNotEmpty) {
                          chatRepository.createNewChat(["1", "2"], chatTitle);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChatLoaded) {
              final chats = state.chats;
              if (chats.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'No chats yet. Start a conversation!',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
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
