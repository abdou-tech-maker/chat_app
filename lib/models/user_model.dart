import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final DateTime lastSeen;
  @HiveField(5)
  final bool isOnline;
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

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
      uid: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      lastSeen: (data['lastSeen'] as Timestamp).toDate(),
      isOnline: data['isOnline'] ?? false,
    );
  }
}
