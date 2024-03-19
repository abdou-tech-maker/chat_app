// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserHeader extends StatelessWidget implements PreferredSizeWidget {
  final User user;

  const UserHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  user.isOnline ? "Online" : "Offline",
                  style: TextStyle(
                      fontSize: 12,
                      color: user.isOnline ? Colors.green : Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              textDirection: TextDirection.ltr,
              size: 22,
            ),
          ),
        )

        //),
        );
  }
}
