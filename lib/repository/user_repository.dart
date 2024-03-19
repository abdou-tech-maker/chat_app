import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<User>> getUsers() {
    return _firestore
        .collection('User')
        .orderBy('lastSeen', descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs.map((doc) {
              var data = doc.data();
              return User(
                uid: data['uid'],
                name: data['name'],
                email: data['email'],
                imageUrl: data['imageUrl'],
                lastSeen: (data['lastSeen'] as Timestamp).toDate(),
                isOnline: data['isOnline'],
              );
            }).toList());
  }

  Future<User> getReceiverInfo(
      List<String> participants, String currentUserId) async {
    final receiverId = participants.firstWhere((id) => id != currentUserId);
    var docSnapshot = await FirebaseFirestore.instance
        .collection('User')
        .doc(receiverId)
        .get();

    if (!docSnapshot.exists) {
      throw Exception("User does not exist");
    }

    return User.fromFirestore(docSnapshot);
  }
  // Stream<User> getReceiverInfo(
  //     List<String> participants, String currentUserId) {
  //   final receiverId = participants.firstWhere((id) => id != currentUserId);
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(receiverId)
  //       .snapshots()
  //       .map((snapshot) {
  //     // Check for null data before proceeding with casting.
  //     var data = snapshot.data() ?? {}; // Use an empty map as a fallback.

  //     // Assuming you have a constructor or method in your User class to handle default values properly.
  //     return User(
  //       uid: data['uid'] ?? '',
  //       name: data['name'] ?? '',
  //       email: data['email'] ?? '',
  //       imageUrl: data['imageUrl'] ?? '',
  //       // Handle the Timestamp conversion with a null check.
  //       lastSeen: data.containsKey('lastSeen')
  //           ? (data['lastSeen'] as Timestamp).toDate()
  //           : DateTime.now(),
  //       isOnline: data['isOnline'] ?? false,
  //     );
  //   });
  // }
}
