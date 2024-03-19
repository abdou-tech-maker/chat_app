// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/chat_bloc.dart';
// import '../bloc/states/chat_states.dart';
// import 'message_bubble.dart';

// class MessageList extends StatefulWidget {
//   const MessageList({super.key, required this.recieverId});
//   final String recieverId;

//   @override
//   State<MessageList> createState() => _MessageListState();
// }

// class _MessageListState extends State<MessageList> {
//   @override
//   void initState() {
//     super.initState();
//     // BlocProvider.of<ChatBloc>(context)
//     //     .add(UserEvent.getChat(, ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ChatBloc, ChatState>(
//       builder: (context, state) {
//         if (state is ChatLoading) {
//           return const Expanded(
//               child: Center(child: CircularProgressIndicator()));
//         } else if (state is ChatLoaded) {
//           return Expanded(
//             child: ListView.builder(
//               itemCount: state.messages.length,
//               itemBuilder: (context, index) {
//                 final message = state.messages[index];
//                 final isMe = widget.recieverId != message.senderId;

//                 return MessageBubble(
//                   message: message,
//                   isMe: isMe,
//                 );
//                 // Build and return a widget for each ChatMessage
//               },
//             ),
//           );
//         } else if (state is ChatLoadFailure) {
//           return const Center(child: Text('Failed to load chat messages.'));
//         } else {
//           return Container(); // An empty container for uninitialized state
//         }
//       },
//     );
//   }
// }
