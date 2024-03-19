import 'dart:async';
import 'dart:developer';

import 'package:chat_task/bloc/states/chat_states.dart';
import 'package:chat_task/repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/user_event.dart';

class ChatBloc extends Bloc<UserEvent, ChatState> {
  final ChatRepository chatRepository = ChatRepository();
  StreamSubscription? _chatSubscription;

  ChatBloc() : super(ChatLoading()) {
    on<GetListChat>(_onGetChat);
    on<ChatsUpdated>(_onChatsUpdatedEvent);

    // on<SendMessage>(_onSendMessage);
  }

  void _onGetChat(GetListChat event, Emitter<ChatState> emit) {
    log('Load Chats event');
    emit(ChatLoading());
    _chatSubscription?.cancel();
    _chatSubscription = chatRepository
        .getUserChatList(
      event.currentUserId,
    )
        .listen(
      (chats) {
        add(ChatsUpdated(chats));
      },
      onError: (error) {
        emit(ChatLoadFailure());
      },
    );
  }

  void _onChatsUpdatedEvent(ChatsUpdated event, Emitter<ChatState> emit) {
    log('chat event received : ${event.chats.length} chats');
    emit(ChatLoaded(event.chats));
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }
}
