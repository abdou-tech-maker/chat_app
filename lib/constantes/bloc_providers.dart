// ignore_for_file: library_prefixes

import 'package:chat_task/bloc/chat_bloc.dart';
import 'package:chat_task/bloc/message_bloc.dart';
import 'package:chat_task/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> getProvidersArray(BuildContext context) {
  return [
    BlocProvider<UsersBloc>(
      create: (BuildContext context) => UsersBloc(),
    ),
    BlocProvider<ChatBloc>(
      create: (BuildContext context) => ChatBloc(),
    ),
    BlocProvider<MessageBloc>(
      create: (BuildContext context) => MessageBloc(),
    ),
  ];
}
