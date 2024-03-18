import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<User> users;
  UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UsersLoadFailure extends UserState {}
