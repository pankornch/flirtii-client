import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/models/message.dart';
import 'package:flirtii/shared/CircleContainer.dart';
import 'package:flutter/material.dart';

class ChatTextCardRecipent extends StatelessWidget {
  final Message message;
  const ChatTextCardRecipent({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 50,
          ),
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: kMainPurpleColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              "${message.text}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTextCardSender extends StatelessWidget {
  final Message message;
  const ChatTextCardSender({Key? key, required this.message}) : super(key: key);
  final img = "https://i.pravatar.cc/150?u";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CircleContainer(
            size: 30,
            child: Image.network(
              "$img=${message.user?.id}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text("${message.text}"),
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
