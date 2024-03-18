import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/events/user_event.dart';
import '../bloc/states/user_state.dart';
import '../bloc/user_bloc.dart';

class FirstUser extends StatefulWidget {
  const FirstUser({super.key});

  @override
  State<FirstUser> createState() => _FirstUserState();
}

class _FirstUserState extends State<FirstUser> {
  @override
  void initState() {
    super.initState();
    // context.read<UsersBloc>().add(const UserEvent.loadUsers());
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
              final users = state.users;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.imageUrl ?? ""),
                    ),
                    title: Text(user.name ?? ""),
                    subtitle: Text(user.email ?? ""),
                  );
                },
              );
            } else if (state is UsersLoadFailure) {
              // Display an error message
              return const Center(child: Text('Failed to load users.'));
            } else {
              return const Center(child: Text('Unknown state.'));
            }
          },
        ));
  }
}
