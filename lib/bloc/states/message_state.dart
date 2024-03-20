import 'package:chat_task/models/chatMessage_model.dart';
import 'package:equatable/equatable.dart';

abstract class MessageState extends Equatable {
  @override
  List<Object> get props => [];
}

class MessageLoading extends MessageState {}

class MessageLoaded extends MessageState {
  final List<ChatMessage> messages;
  MessageLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class MessageLoadFailure extends MessageState {}
