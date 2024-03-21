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
}
