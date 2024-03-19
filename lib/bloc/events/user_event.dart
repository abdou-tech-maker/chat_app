// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:chat_task/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/chat_model.dart';

part 'user_event.freezed.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.loadUsers() = LoadUsers;
  const factory UserEvent.usersUpdated(List<User> users) = UsersUpdated;
  const factory UserEvent.distract() = Distract;
  const factory UserEvent.getChat(String chatId, String senderId) = GetChat;
  const factory UserEvent.chatList(String currentUserId) = GetListChat;
  const factory UserEvent.chatsUpdated(List<ChatModel> chats) = ChatsUpdated;
}
