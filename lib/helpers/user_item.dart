import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/user_model.dart';
import 'chat_screen.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChatScreen(
              user: user,
            ),
          ),
        );
      },
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl ?? ""),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: user.isOnline != null
                      ? (user.isOnline! ? Colors.green : Colors.red)
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        title: Text(user.name ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(timeago.format(user.lastSeen ?? DateTime.now())),
      ),
    );
  }
}
