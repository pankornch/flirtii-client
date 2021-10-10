import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/screens/chats/chat_by_id/widgets/bottom_bar.dart';
import 'package:flirtii/screens/chats/chat_by_id/widgets/text_card.dart';
import 'package:flirtii/shared/CircleContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatByIdScreen extends StatefulWidget {
  ChatByIdScreen({Key? key}) : super(key: key);

  @override
  _ChatByIdScreenState createState() => _ChatByIdScreenState();
}

class _ChatByIdScreenState extends State<ChatByIdScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kMainPurpleColor,
        title: Row(
          children: [
            CircleContainer(
              size: 40,
              child: Image.network(
                "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text("Elwood Duran"),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          child: ListView(
            reverse: true,
            controller: _scrollController,
            children: [
              for (int i = 0; i < 10; i++) ChatTextCardSender(),
              ChatTextCardRecipent(),
              for (int i = 0; i < 10; i++) ChatTextCardSender(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChatBottomBar(),
    );
  }
}
