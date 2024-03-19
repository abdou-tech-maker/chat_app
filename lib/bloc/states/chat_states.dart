import 'package:chat_task/models/chat_model.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatModel> chats;
  ChatLoaded(this.chats);

  @override
  List<Object> get props => [chats];
}

class ChatLoadFailure extends ChatState {}
