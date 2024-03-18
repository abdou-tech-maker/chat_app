import 'dart:async';
import 'dart:developer';

import 'package:chat_task/bloc/states/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/user_repository.dart';
import 'events/user_event.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository = UserRepository();
  StreamSubscription? _usersSubscription;

  UsersBloc() : super(UsersLoading()) {
    on<LoadUsers>(_onLoadUsers);
    on<UsersUpdated>(_onUsersUpdatedEvent);
  }

  void _onLoadUsers(LoadUsers event, Emitter<UserState> emit) {
    log('LoadUsers event');
    emit(UsersLoading());

    _usersSubscription?.cancel();
    _usersSubscription = userRepository.getUsers().listen(
      (users) {
        add(UsersUpdated(users));
      },
      onError: (error) {
        log('Error listening to users: $error');
        emit(UsersLoadFailure());
      },
    );
  }

  void _onUsersUpdatedEvent(UsersUpdated event, Emitter<UserState> emit) {
    log('UsersUpdated event received : ${event.users.length} users');
    emit(UsersLoaded(event.users));
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel();
    return super.close();
  }
}
