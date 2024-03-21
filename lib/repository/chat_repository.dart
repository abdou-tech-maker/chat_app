// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:chat_task/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/chatMessage_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatMessage>> getMessages(String chatId, String currentUserId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return ChatMessage.fromFirestore(doc);
            }).toList())
        .handleError((error) {
      log("Error fetching messages: $error");
      return [];
    });
  }

  Stream<List<ChatModel>> getUserChatList(String currentUserId) {
    return _firestore
        .collection('chats')
        .where('participants', arrayContains: currentUserId)
        .orderBy('lastMessageTime', descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs.map((doc) {
              var data = doc.data();
              return ChatModel(
                id: doc.id,
                title: data['title'],
                lastMessageTime: data['lastMessageTime'],
                messages: [],
                unreadMessagesCount: List<int>.from(data['unReadMessageCount']),
                participants: List<String>.from(data['participants']),
              );
            }).toList());
  }

  Future<void> sendMessage(
      {required String chatId,
      required ChatMessage message,
      required String recieverId,
      required String senderId}) async {
    final messageCollection =
        _firestore.collection('chats').doc(chatId).collection('messages');
    final chatDocument = _firestore.collection('chats').doc(chatId);
    bool isMe = message.senderId == senderId;
    await messageCollection.add({
      'senderId': senderId,
      'recieverId': recieverId,
      'text': message.text,
      'time': Timestamp.now(),
      'isMe': isMe,
      'status': false
    });

    int indexToUpdate = senderId == "1" ? 1 : 0;
    DocumentSnapshot chatDocSnapshot = await chatDocument.get();
    List<dynamic> currentUnreadMessageCount =
        chatDocSnapshot.get('unReadMessageCount') as List<dynamic>;

    List<int> newUnreadMessageCount = List<int>.from(currentUnreadMessageCount);
    if (indexToUpdate >= 0 && indexToUpdate < newUnreadMessageCount.length) {
      newUnreadMessageCount[indexToUpdate] += 1;
    }

    await chatDocument.update({
      'lastMessageTime': Timestamp.now(),
      'unReadMessageCount': newUnreadMessageCount,
    });
  }

  Future<void> createNewChat(List<String> participantIds, String title) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('chats').add({
      'participants': participantIds,
      'title': title,
      'lastMessageTime': Timestamp.now(),
      'unReadMessageCount': [0, 0],
      'messages': [],
    });
  }

  Future<void> resetUnreadMessageCount(String chatId, int userIndex) async {
    var chatDocRef = FirebaseFirestore.instance.collection('chats').doc(chatId);

    var chatDocSnapshot = await chatDocRef.get();
    var data = chatDocSnapshot.data();

    if (data != null) {
      List<int> unreadCounts;
      if (data['unReadMessageCount'] != null) {
        unreadCounts =
            List<int>.from(data['unReadMessageCount'] as List<dynamic>);

        log("unReadCounts: $unreadCounts");
      } else {
        unreadCounts = [0, 0];
      }

      if (unreadCounts.length > userIndex) {
        unreadCounts[userIndex] = 0;

        await chatDocRef.update({'unReadMessageCount': unreadCounts});
      } else {
        log("Error: unreadMessageCount array does not have the expected number of elements.");
      }
    } else {
      log("Error: Chat document data is null.");
    }
  }

  Future<void> deleteChat(BuildContext context, String chatId) async {
    try {
      await FirebaseFirestore.instance.collection('chats').doc(chatId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chat deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete chat')),
      );
    }
  }
}
