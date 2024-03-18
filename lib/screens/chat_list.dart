import 'package:chat_task/helpers/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/events/user_event.dart';
import '../bloc/states/user_state.dart';
import '../bloc/user_bloc.dart';

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
    BlocProvider.of<UsersBloc>(context).add(const LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<UsersBloc, UserState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UsersLoaded) {
              final users = state.users
                  .where((user) => user.uid != widget.currentUserId)
                  .toList();
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                physics: const BouncingScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserItem(user: user);
                },
              );
            } else if (state is UsersLoadFailure) {
              return const Center(child: Text('Failed to load users.'));
            } else {
              return const Center(child: Text('Unknown state.'));
            }
          },
        ));
  }
}
