import 'package:flirtii/screens/chats/widgets/card.dart';
import 'package:flirtii/screens/chats/widgets/navbar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ChatNavBar(),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: ListView(
              children: [
                for (int i = 0; i < 10; i++) ChatCard(),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
