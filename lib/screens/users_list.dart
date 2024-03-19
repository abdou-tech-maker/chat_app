import 'package:chat_task/bloc/states/chat_states.dart';
import 'package:chat_task/bloc/states/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/events/user_event.dart';
import '../bloc/user_bloc.dart';
import '../helpers/user_item.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key, required this.currentUserId});
  final String currentUserId;
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersBloc>(context).add(const UserEvent.loadUsers());
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
              final users = state.users;

              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                physics: const BouncingScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserItem(
                    user: user,
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
