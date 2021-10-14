import 'package:flutter/material.dart';

class ChatNavBar extends StatelessWidget {
  const ChatNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          spreadRadius: 0,
          blurRadius: 1,
          offset: Offset(0, 4),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Chats",
            style: TextStyle(fontSize: 24),
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
