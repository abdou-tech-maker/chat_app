import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<User>> getUsers() {
    return _firestore
        .collection('User')
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
}
