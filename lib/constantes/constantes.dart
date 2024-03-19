import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/chatMessage_model.dart';

const Color liteTxt = Color(0xFFB9BCBE);

const Color blackText = Color(0xFF121212);
const Color backGround = Color(0xFFEDF2FF);
const Color redColor = Color(0xFFD8192C);

const Color greyBackGround = Color(0xFFAFB2B8);
const Color gradientGray = Color.fromARGB(255, 255, 255, 255);
const Color selectedIcon = Color(0xFF008AFF);
const Color headerColor = Color(0xFFA8A8A8);
const Color greyTxt = Color(0xFF7C7C7C);
const Color unselectedIcon = Color(0xFF7EA2B7);
const Color iconColor = Color(0xFF111111);
const Color pending = Color.fromARGB(255, 194, 166, 253);
const Color hardPending = Color(0XFF8952FF);
const Color desactivatedButton = Color(0XFF526EFF);
const Color headerGrey = Color(0xFF444444);
const Color greenColor = Color(0xFF16A34A);
const Color navIconColor = Color(0xf04986c5);
List<ChatMessage> dummyChatMessages = [
  ChatMessage(
    recieverId: "1",
    senderId: "user_1",
    text: "Hello! How are you today?",
    time:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(minutes: 5))),
    isMe: false,
    status: true,
  ),
  ChatMessage(
    recieverId: "2",
    senderId: "user_2",
    text: "Hi! I'm good, thanks for asking. And you?",
    time:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(minutes: 4))),
    isMe: true,
    status: true,
  ),
  ChatMessage(
    recieverId: "3",
    senderId: "user_1",
    text: "I'm great, thanks! Did you complete the project?",
    time:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(minutes: 4))),
    isMe: false,
    status: true,
  ),
  ChatMessage(
    recieverId: "4",
    senderId: "user_2",
    text: "Yes, I sent it over for review. Fingers crossed!",
    time:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(minutes: 4))),
    isMe: true,
    status: true,
  ),
  ChatMessage(
    recieverId: "5",
    senderId: "user_1",
    text: "Awesome! Let me know how it goes.",
    time:
        Timestamp.fromDate(DateTime.now().subtract(const Duration(minutes: 4))),
    isMe: false,
    status: true,
  ),
];
