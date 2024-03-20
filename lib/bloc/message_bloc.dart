import 'dart:async';
import 'dart:developer';

import 'package:chat_task/bloc/states/message_state.dart';
import 'package:chat_task/repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/user_event.dart';

class MessageBloc extends Bloc<UserEvent, MessageState> {
  final ChatRepository chatRepository = ChatRepository();
  StreamSubscription? _messageSubscription;

  MessageBloc() : super(MessageLoading()) {
    on<GetMessages>(_onGetMessage);
    on<MessageUpdated>(_onMessagesUpdatedEvent);
  }

  void _onGetMessage(GetMessages event, Emitter<MessageState> emit) {
    log('Load Messages event');
    emit(MessageLoading());
    _messageSubscription?.cancel();
    _messageSubscription =
        chatRepository.getMessages(event.chatId, event.senderId).listen(
      (messages) {
        add(MessageUpdated(messages));
      },
      onError: (error) {
        emit(MessageLoadFailure());
      },
    );
  }

  void _onMessagesUpdatedEvent(
      MessageUpdated event, Emitter<MessageState> emit) {
    log('Message event received : ${event.messages.length} Messages');
    emit(MessageLoaded(event.messages));
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    return super.close();
  }
}
