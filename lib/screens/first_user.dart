import 'package:flutter/material.dart';

class FirstUser extends StatefulWidget {
  const FirstUser({super.key});

  @override
  State<FirstUser> createState() => _FirstUserState();
}

class _FirstUserState extends State<FirstUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
