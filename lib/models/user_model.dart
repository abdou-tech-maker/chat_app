import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String? uid;

  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? imageUrl;
  @HiveField(4)
  final DateTime? lastSeen;
  @HiveField(5)
  final bool? isOnline;
  const User({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.lastSeen,
    required this.isOnline,
  });

  @override
  List<Object?> get props => [uid, name, email, imageUrl, isOnline, lastSeen];
}
