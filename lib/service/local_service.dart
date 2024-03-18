import 'package:hive/hive.dart';

import '../models/user_model.dart';

Future<void> initializeUsers() async {
  var box = Hive.box('userBox');

  if (box.isEmpty) {
    final user1 = User(
      uid: '1',
      name: "User 1",
      email: 'user1@gmail.com',
      imageUrl: 'https://i.pravatar.cc/150?img=11',
      isOnline: true,
      lastSeen: DateTime.now(),
    );

    final user2 = User(
      uid: '2',
      name: "User 2",
      email: 'user2@gmail.com',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
      isOnline: true,
      lastSeen: DateTime.now(),
    );

    await box.add(user1);
    await box.add(user2);
  }
}
