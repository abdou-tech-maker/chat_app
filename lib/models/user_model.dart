import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  User({required this.id, required this.name});
}
