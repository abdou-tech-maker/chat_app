import 'package:hive/hive.dart';

import '../models/user_model.dart';

Future<void> initializeUsers() async {
  var box = Hive.box('userBox');

  if (box.isEmpty) {
    final user1 = User(
      id: "user1",
      name: "User 1",
    );

    final user2 = User(id: "user2", name: "User 2");

    await box.add(user1);
    await box.add(user2);
  }
}
